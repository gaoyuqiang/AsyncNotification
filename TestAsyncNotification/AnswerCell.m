//
//  MyTableViewCell.m
//  TestAsyncNotification
//
//  Created by gao on 2017/6/2.
//  Copyright © 2017年 58. All rights reserved.
//

#import "AnswerCell.h"
#import "AsyncNotification.h"

@interface AnswerCell()

@property(nonatomic, strong) UILabel *answerLabel;
@property(nonatomic, strong) UILabel *commentLabel;

@end
@implementation AnswerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _answerLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 360, 40)];
        
        _commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 40, 200, 40)];
        _commentLabel.font = [UIFont systemFontOfSize:12];
        _commentLabel.text = @"-->0评论";
        
        [self.contentView addSubview:_answerLabel];
        [self.contentView addSubview:_commentLabel];
    }
    return self;
}

- (void)setModel:(Answer *)model {
    _model = model;
    
    _answerLabel.text = [NSString stringWithFormat:@"%@", _model.content];
    _commentLabel.text = [NSString stringWithFormat:@"-->%@评论", _model.commentCount];
    
    //监听comment改变
    [[AsyncNotification share] an_observer:self name:@"comment" objectId:_model.answerId block:^(id objectId, id object) {
        _model.commentCount = object;
        _commentLabel.text = [NSString stringWithFormat:@"-->%@评论", object];
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
