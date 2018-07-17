//
//  MDUserTool.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/12/1.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDUserTool.h"
#import "MDLoginViewController.h"
#import "MDBaseNavigationViewController.h"

#define kMSecret        @"kMSecret"


@implementation MDUserTool

+ (BOOL)isLogin
{
    return [[USERDEFAULT valueForKey:kMSecret] isValid];
}

+ (BOOL)isLoginAndGotoLogin
{
    if ([self isLogin]) {
        return true;

    } else {
        [self presentLoginVC];
        return false;
    }
}

+ (void)presentLoginVC
{
    MDLoginViewController *loginVC = [[MDLoginViewController alloc] init];
    [[MDNemoHelper rootViewController] presentViewController:loginVC animated:YES completion:nil];
}

@end
