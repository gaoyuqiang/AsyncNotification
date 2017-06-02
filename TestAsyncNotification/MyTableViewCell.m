//
//  MyTableViewCell.m
//  TestAsyncNotification
//
//  Created by gao on 2017/6/2.
//  Copyright © 2017年 58. All rights reserved.
//

#import "MyTableViewCell.h"
#import "AsyncNotification.h"

@interface MyTableViewCell()

@property(nonatomic, strong) UILabel *label;

@end
@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 200, 30)];
        _label.text = @"0";
        
        [self.contentView addSubview:_label];
    }
    return self;
}

- (void)setModel:(Foo *)model {
    _model = model;
    self.textLabel.text = _model.answerId;
    
    _label.text = model.commentCount;
    
    [[AsyncNotification share] an_observer:self name:@"comment" block:^(id object1, id object2) {
        if ([object1 isEqualToString:_model.answerId]) {
            _model.commentCount = object2;
            _label.text = object2;
        }
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
