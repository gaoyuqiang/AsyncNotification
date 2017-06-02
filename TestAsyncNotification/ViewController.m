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

@interface ViewController ()

@property(nonatomic, strong) NSMapTable *table;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    BagView *bagView = [[BagView alloc] initWithFrame:CGRectMake(10, 70, 200, 100)];
    bagView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:bagView];
    
//    _table = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsWeakMemory valueOptions:NSPointerFunctionsStrongMemory];
//    NSObject *a = [NSObject new];
//    
//    [_table setObject:@"hello" forKey:a];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [[AsyncNotification share] an_notify:@"comment" object:@"modify------succ"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
