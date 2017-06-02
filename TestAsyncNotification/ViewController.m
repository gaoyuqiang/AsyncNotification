//
//  ViewController.m
//  TestAsyncNotification
//
//  Created by gao on 2017/6/1.
//  Copyright © 2017年 58. All rights reserved.
//

#import "ViewController.h"
#import "AsyncNotification.h"
#import "Answer.h"
#import "AnswerCell.h"
#import "CommentViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *models;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"答案页";
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 1)];
    _tableView.rowHeight = 80;

    [self.view addSubview:_tableView];
    
    //模拟请求数据
    [self requestCommentCount];
}

- (void)requestCommentCount {
    _models = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        Answer *model = [[Answer alloc] init];
        model.answerId =  [NSString stringWithFormat:@"%d", i];
        model.content = [NSString stringWithFormat:@"哥俩好，你好我也好，舅服你 %d", i];
        model.commentCount = @"0";
        
        [_models addObject:model];
    }
    
    [_tableView reloadData];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* identifier = @"cell";
    AnswerCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[AnswerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.model = [_models objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Answer *model = [_models objectAtIndex:indexPath.row];
    CommentViewController *vc = [[CommentViewController alloc] init];
    vc.count = [model.commentCount intValue];
    vc.answerId = model.answerId;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
