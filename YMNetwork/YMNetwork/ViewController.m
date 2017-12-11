//
//  ViewController.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 30)];
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClicked:(UIButton *)sender{
    NSLog(@"button clicked");
    
    YMTask *task = [YMManager getRegisterTaskWithAccount:@"18210039227" password:@"123456" verifyCode:@"235347" completeHandler:^(YMResult * _Nonnull result, User * _Nonnull user) {
        if (result.code == DfthRC_Ok) {
            NSLog(@"注册成功");
        }else{
            NSLog(@"注册失败:%@",result.message);
        }
    }];
    [task async];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
