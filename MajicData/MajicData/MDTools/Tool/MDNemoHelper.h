//
//  MDNemoHelper.h
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/30.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDNemoHelper : NSObject



#pragma mark -- VC  Method

+ (UIViewController *)rootViewController;


#pragma mark -- UIKit Method

/**
 初始化一个Label

 @param backgroundColor 背景色
 @param title 文字
 @param size 字体
 @param textcolor 文字颜色
 @return UILabel
 */
+ (UILabel *) getLabelPropertyWithBackgroundColor:(UIColor *) backgroundColor Title:(NSString *)title Font:(CGFloat) size TextColor:(UIColor *)textcolor;

@end
