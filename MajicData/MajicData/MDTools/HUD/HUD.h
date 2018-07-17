//
//  HUD.h
//  J-nife
//
//  Created by Tommy on 2017/5/2.
//  Copyright © 2017年 JDL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"


@interface HUD : NSObject

+ (void)show;

+ (void)dissmiss;

+ (void)showWithTime:(NSInteger)time;

+ (void)showStringWithTime:(NSString *)str time:(NSInteger)time;


@end
