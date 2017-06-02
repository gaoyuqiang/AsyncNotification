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
        
        [self addSubview:_label];
    }
    
    return self;
}

- (void)setModel:(Foo *)model {
    _model = model;
//    [[AsyncNotification share] an_observer:self name:@"comment" block:^(id object) {
//        _label.text = object;
//    }];
}
@end
