//
//  ViewController.m
//  CumBox
//
//  Created by 陈世誉 on 15/6/4.
//  Copyright (c) 2015年 陈世誉. All rights reserved.
//

#import "ViewController.h"
#import "CustmBox.h"
#import "CSYPickView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    CustmBox *cus=[[CustmBox alloc]initWithFrame:CGRectMake(50, 100, 80, 40) andAddview:self.view];
    [self.view addSubview:cus];
    CSYPickView *pick=[[CSYPickView alloc]initWithFrame:CGRectMake(150, 100, 200, 40) andAddview:self.view];
    pick.backgroundColor=[UIColor grayColor];
    [self.view addSubview:pick];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
