//
//  AsyncNotification.m
//  TestAsyncNotification
//
//  Created by gao on 2017/6/1.
//  Copyright © 2017年 58. All rights reserved.
//

#import "AsyncNotification.h"

@implementation ANNotificationModel

@end

@interface AsyncNotification ()

@property(nonatomic, strong) NSMapTable <id, NSMutableArray<ANNotificationModel *>*>*dic;// key:id, value:nsarray->nsarray里放了model
@property(nonatomic, strong) dispatch_queue_t queue;//自己的通知队列

@end
@implementation AsyncNotification

+ (instancetype)share {
    static AsyncNotification *object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[AsyncNotification alloc] init];
    });
    
    return object;
}

- (instancetype)init {
    if (self = [super init]) {
        _dic = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsWeakMemory valueOptions:NSPointerFunctionsStrongMemory];
        _queue = dispatch_queue_create("asyncNotification", DISPATCH_QUEUE_CONCURRENT);
    }
    
    return self;
}

- (void)an_observer:(id)observer name:(NSString *)name objectId:(NSString *)objectId block:(ANNotificationBlock)block {
    
    dispatch_barrier_async(_queue, ^{//线程安全
        NSMutableArray *models = [_dic objectForKey:observer] == nil ? [NSMutableArray array] : [_dic objectForKey:observer];
        
        //如果有相同的name 直接替换block,保证每个observer里一个name只对应一个block.主要是为了解决cell复用这个头疼的问题。但是可能会误伤自己，因为可能一个observer里写了两处name相同的代码
        for (ANNotificationModel *model in models) {
            if ([model.name isEqualToString:name]) {
                model.block = block;
                model.objectId = objectId;
                return;
            }
        }
        
        
        //生成model
        ANNotificationModel *model = [[ANNotificationModel alloc] init];
        model.name = name;
        model.block = block;
        model.objectId = objectId;
        //存入model
        [models addObject:model];
        [_dic setObject:models forKey:observer];
    });
}

- (void)an_notify:(NSString *)name object1:(id)object1 object2:(id)object2 {
    dispatch_async(_queue, ^{
        //遍历所有的model 如果name匹配 则invoke block
        for (id observer in _dic) {
            NSMutableArray <ANNotificationModel *>*models = [_dic objectForKey:observer];
            
            for (ANNotificationModel *model in models) {
                if ([model.name isEqualToString:name] && [model.objectId isEqualToString:object1]) {
                    if (model.block) {
                        //主队列执行
                        dispatch_async(dispatch_get_main_queue(), ^{
                            model.block(object1, object2);
                        });
                    }
                }
            }
        }
    });
}

@end
