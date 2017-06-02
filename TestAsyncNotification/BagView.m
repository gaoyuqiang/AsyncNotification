//
//  BagView.m
//  TestAsyncNotification
//
//  Created by gao on 2017/6/1.
//  Copyright © 2017年 58. All rights reserved.
//

#import "BagView.h"

@interface BagView()

@property(nonatomic, strong) UILabel *label;

@end

@implementation BagView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 30)];
        _label.text = @"test";
        
        [[AsyncNotification share] an_observer:@"comment" block:^(id object){
            _label.text = object;
        }];
        [self addSubview:_label];
    }
    
    return self;
}


@end
