//
//  MDUserTool.h
//  MajicData
//
//  Created by Tesla_Chen on 2017/12/1.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDUserTool : NSObject


+ (BOOL)isLogin;

+ (BOOL)isLoginAndGotoLogin;

+ (void)presentLoginVC;



@end
