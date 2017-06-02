//
//  AsyncNotification.h
//  TestAsyncNotification
//
//  Created by gao on 2017/6/1.
//  Copyright © 2017年 58. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ANNotificationBlock)(id object);
@interface AsyncNotification : NSObject

+ (instancetype)share;

//添加监听
- (void)an_observer:(NSString *)key block:(ANNotificationBlock)block;

//发送通知
- (void)an_notify:(NSString *)key object:(id)object;

@end
