//
//  AsyncNotification.h
//  TestAsyncNotification
//
//  Created by gao on 2017/6/1.
//  Copyright © 2017年 58. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ANNotificationBlock)(id object1, id object2);


@interface ANNotificationModel : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *objectId;
@property(nonatomic, copy)  ANNotificationBlock block;

@end

@interface AsyncNotification : NSObject

+ (instancetype)share;

//添加监听
- (void)an_observer:(id)observer name:(NSString *)name objectId:(NSString *)objectId block:(ANNotificationBlock)block;

//发送通知
- (void)an_notify:(NSString *)name object1:(id)object1 object2:(id)object2;

@end
