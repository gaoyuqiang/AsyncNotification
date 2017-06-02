//
//  Foo.h
//  TestAsyncNotification
//
//  Created by gao on 2017/6/1.
//  Copyright © 2017年 58. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Answer : NSObject

//id
@property(nonatomic, strong) NSString *answerId;
//内容
@property(nonatomic, strong) NSString *content;
//评论数
@property(nonatomic, strong) NSString *commentCount;

@end
