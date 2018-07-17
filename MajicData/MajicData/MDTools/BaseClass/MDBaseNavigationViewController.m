//
//  MDBaseNavigationViewController.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/22.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDBaseNavigationViewController.h"

@interface MDBaseNavigationViewController ()

@end

@implementation MDBaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景色
    [self.navigationBar setBarTintColor:KColor_Main];
    
    //去掉高斯模糊
    [self.navigationBar setTranslucent:NO];
    [self.navigationBar setShadowImage:[UIImage new]];
    
    //隐藏底线
    UIView *backView = (UIView *)[self.navigationBar subviews].firstObject;
    [[backView subviews].firstObject setHidden:YES];
    
    //设置titleColor
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : KColor_White}];
    
}


#pragma mark - Navigation Controller Delegate
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
