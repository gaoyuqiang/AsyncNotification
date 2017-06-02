//
//  ViewController.m
//  TestAsyncNotification
//
//  Created by gao on 2017/6/1.
//  Copyright © 2017年 58. All rights reserved.
//

#import "ViewController.h"
#import "BagView.h"
#import "AsyncNotification.h"
#import "SecondViewController.h"
#import "Foo.h"
#import "MyTableViewCell.h"
#import "ThreeViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) BagView *bagView;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *models;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"viewcontroller";
    
//    _bagView = [[BagView alloc] initWithFrame:CGRectMake(10, 70, 200, 100)];
//    _bagView.backgroundColor = [UIColor yellowColor];
//    
//    [self.view addSubview:_bagView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 375, 400) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor yellowColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    _tableView.rowHeight = 40;

    [self.view addSubview:_tableView];
    
    //请求数据
    [self requestCommentCount];
}

- (void)requestCommentCount {
    _models = [NSMutableArray array];
    for (int i = 0; i < 40; i++) {
        Foo *model = [[Foo alloc] init];
        model.answerId =  [NSString stringWithFormat:@"%d", i];
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
    MyTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.model = [_models objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Foo *model = [_models objectAtIndex:indexPath.row];
    ThreeViewController *vc = [[ThreeViewController alloc] init];
    vc.count = [model.commentCount intValue];
    vc.answerId = model.answerId;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
