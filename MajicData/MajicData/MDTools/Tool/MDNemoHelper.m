//
//  MDNemoHelper.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/30.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDNemoHelper.h"

@implementation MDNemoHelper

+ (UIViewController *)rootViewController
{
    UIViewController* root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    return root;
}



+ (UILabel *) getLabelPropertyWithBackgroundColor:(UIColor *) backgroundColor Title:(NSString *)title Font:(CGFloat) size TextColor:(UIColor *)textcolor {
    UILabel *testLabel = [[UILabel alloc] init];
    [testLabel setBackgroundColor: backgroundColor];
    
    [testLabel setFont:[UIFont systemFontOfSize:size]];
    [testLabel setTextColor:textcolor];
    [testLabel setText:[NSString stringWithFormat:@"%@",title]];
    return  testLabel;
}


@end
