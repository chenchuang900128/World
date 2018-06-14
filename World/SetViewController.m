//
//  SetViewController.m
//  World
//
//  Created by 陈创 on 2018/6/13.
//  Copyright © 2018年 陈创. All rights reserved.
//

#import "SetViewController.h"
#import "HZLanguageManager.h"
#import "ViewController.h"


@interface SetViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, readwrite, strong) NSArray<NSString *> *selectArray;

@end

@implementation SetViewController

- (void)cancelClick:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selectArray=@[HZLocalizedString(@"Follow the system", nil),@"中文",@"English"];

//    UIButton *nextStep = [UIButton buttonWithType:UIButtonTypeCustom];
//    [nextStep setFrame:CGRectMake(self.view.frame.size.width - 100, 5, 80, 40)];
//    [nextStep setTitle:HZLocalizedString(@"Cancel", nil) forState:UIControlStateNormal];
//    nextStep.backgroundColor = [UIColor redColor];
//    [nextStep addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:nextStep];
    
    
    UITableView *myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height - 30) style:UITableViewStylePlain];
    myTableView.separatorStyle = UITableViewCellSelectionStyleGray;
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    // Do any additional setup after loading the view.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.selectArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *const cellID = @"CellID";
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (myCell == nil) {
        
        myCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];

    }
    myCell.textLabel.text = self.selectArray[indexPath.row];

    
    return myCell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    //选择更改语言设置
    if (indexPath.row==0) {
        [[HZLanguageManager defaultManager] changeLanguageType: HZLanguageTypeSystem];
    }
    if (indexPath.row==1) {
        [[HZLanguageManager defaultManager] changeLanguageType: HZLanguageTypeChineseSimple];
    }
    if (indexPath.row==2) {
        [[HZLanguageManager defaultManager] changeLanguageType: HZLanguageTypeEnglish];
    }
   
    
    //销毁 root
    UIWindow *oldWindow=[UIApplication sharedApplication].keyWindow;
    oldWindow.rootViewController=nil;
    
    //新 root
    UIWindow *newWindow = [UIApplication sharedApplication].keyWindow;
   
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:vc];;
    newWindow.rootViewController=navVC;
    
  
    //重新 push
    SetViewController *languageVC=[SetViewController new];
    [navVC pushViewController:languageVC animated:NO];

    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [languageVC dismissViewControllerAnimated:YES completion:nil];
//    });
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
