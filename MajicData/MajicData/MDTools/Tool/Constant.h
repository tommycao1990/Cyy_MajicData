//
//  Constant.h
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/22.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#ifndef Constant_h
#define Constant_h


#pragma  mark  -   Tools

#define LocalizedStr(key)  NSLocalizedString(key, @"")
#define NOTIFICENTER       [NSNotificationCenter defaultCenter]
#define USERDEFAULT        [NSUserDefaults standardUserDefaults]
#define RGB(r,g,b)         [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:1.]
#define RGBA(r,g,b,a)      [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:a]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define AppVersion         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define UMComImageWithImageName(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"UMComSDKResources.bundle/images/%@",imageName]]

#define Font_Chinease_Nor(_size)    [UIFont systemFontOfSize:_size]
#define Kimagename_Nor(_name)       [UIImage imageNamed:_name]

#define kSelf __weak typeof(self) wSelf = self;

#pragma  mark  -   UI Constants
#define kMainHeight    [ [ UIScreen mainScreen ] bounds ].size.height
#define kMainWidth     [ [ UIScreen mainScreen ] bounds ].size.width
//#define kMainScale     [ [ UIScreen mainScreen ] bounds ].size.width / 320.0f
#define kMainScaleMiunes   [ [ UIScreen mainScreen ] bounds ].size.width / 375.0f

#define kTabbarHeight       49



#pragma  mark  -  Color


#define KColor_Main                    RGB(19, 158, 255)

#define KColor_White                   UIColorFromRGB(0Xffffff)

#define KColor_Gray                    UIColorFromRGB(0Xf7f7f7)   //背景灰
#define KColor_Gray_99                 UIColorFromRGB(0X999999)   //字色灰
#define KColor_Gray_66                 UIColorFromRGB(0X666666)
#define KColor_Gray_f2                 UIColorFromRGB(0Xf2f2f2)   //活动页背景灰
#define KColor_Yellow                  UIColorFromRGB(0Xffcc00)

#define KColor_Black_Bar               UIColorFromRGB(0X383838)
#define KColor_Black_Main              UIColorFromRGB(0X333333)
#define KColor_Black                   UIColorFromRGB(0X000000)
#define KColor_Black_22                UIColorFromRGB(0X222222)//评论字体黑
#define KColor_Black_Line              UIColorFromRGB(0Xcccccc)
#define KColor_BG_GRAY                 RGB(235, 235, 235)

#define KColor_Purple                  UIColorFromRGB(0X7545f8)  //2.2紫色
#define KColor_Green                   UIColorFromRGB(0X14C162) //绿色
#define KColor_Red_ff0000              UIColorFromRGB(0Xff0000)


#define KColor_red_f9                  UIColorFromRGB(0Xff9999) //淡红色
#define KColor_TestColor_red           [UIColor redColor]

#define KColor_Clear                   [UIColor clearColor]
#define KColor_NO_Color                UIColorFromRGB(0X33cccc)

#define KColor_blue_97                 UIColorFromRGB(0X97C6FD)









#endif /* Constant_h */
