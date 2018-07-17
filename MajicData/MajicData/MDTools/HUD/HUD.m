//
//  HUD.m
//  J-nife
//
//  Created by Tommy on 2017/5/2.
//  Copyright © 2017年 JDL. All rights reserved.
//

#import "HUD.h"
#import "SVProgressHUD.h"

@implementation HUD

+ (void)show{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    //    [SVProgressHUD setForegroundColor:[UIColor blackColor]];
    [SVProgressHUD setBackgroundColor:[UIColor clearColor]];
    [SVProgressHUD show];
}

+ (void)dissmiss{
    [SVProgressHUD dismiss];
}

+ (void)showWithTime:(NSInteger)time{
    [SVProgressHUD dismissWithDelay:time];
}

+ (void)showStringWithTime:(NSString *)str time:(NSInteger)time{
    [SVProgressHUD showWithStatus:str];
    [SVProgressHUD dismissWithDelay:time];
}


@end
