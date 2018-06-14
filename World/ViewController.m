//
//  ViewController.m
//  World
//
//  Created by 陈创 on 2018/6/13.
//  Copyright © 2018年 陈创. All rights reserved.
//

#import "ViewController.h"
#import "HZLanguageManager.h"
#import "SetViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *myLabel = [[UILabel alloc] init];
    myLabel.frame = CGRectMake(20, 80, 290, 60);
    myLabel.text = HZLocalizedString(@"hello,world!", @"");
    myLabel.textAlignment = NSTextAlignmentCenter;
    myLabel.textColor = [UIColor blueColor];
    [self.view addSubview:myLabel];
    
    
    UIButton *nextStep = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextStep setFrame:CGRectMake(100, 230, 100, 50)];
    [nextStep setTitle:HZLocalizedString(@"Next", nil) forState:UIControlStateNormal];
    nextStep.backgroundColor = [UIColor redColor];
    [nextStep addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextStep];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)btnClick:(id)sender{
    
    SetViewController *setVC = [[SetViewController alloc] init];
    [self.navigationController pushViewController:setVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
