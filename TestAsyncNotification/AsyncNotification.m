//
//  AsyncNotification.m
//  TestAsyncNotification
//
//  Created by gao on 2017/6/1.
//  Copyright © 2017年 58. All rights reserved.
//

#import "AsyncNotification.h"

@interface AsyncNotification ()

@property(nonatomic, strong) NSMutableDictionary *dic;

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
        _dic = [NSMutableDictionary dictionary];
    }
    
    return self;
}

- (void)an_observer:(NSString *)key block:(ANNotificationBlock)block {
    NSMutableArray *blocks = [_dic objectForKey:key] == nil ? [NSMutableArray array] : [_dic objectForKey:key];
    
    //添加进入
    [blocks addObject:block];
    [_dic setObject:blocks forKey:key];
}

- (void)an_notify:(NSString *)key object:(id)object {
    NSMutableArray *blocks = [_dic objectForKey:key];
    for (ANNotificationBlock block in blocks) {
        if (block) {
            block(object);
        }
    }
}

@end
