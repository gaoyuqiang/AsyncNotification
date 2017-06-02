//
//  ThreeViewController.m
//  TestAsyncNotification
//
//  Created by gao on 2017/6/2.
//  Copyright © 2017年 58. All rights reserved.
//

#import "ThreeViewController.h"
#import "AsyncNotification.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"点屏幕发comment";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _count++;
    [[AsyncNotification share] an_notify:@"comment" object1:_answerId object2:[NSString stringWithFormat:@"%d", _count]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
