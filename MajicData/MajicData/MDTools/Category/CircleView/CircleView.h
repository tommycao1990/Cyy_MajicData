//
//  CircleView.h
//  AnimationTest
//
//  Created by Tesla_Chen on 2017/11/23.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView




/**
 设置圆环属性

 @param scale 比例
 @param radius 圆环直径
 @param firstColor 第一个圆弧颜色
 @param secondColor 第二个圆弧颜色
 */
- (void) setCircleViewWithScale:(CGFloat) scale Radius:(CGFloat) radius LineWidth:(CGFloat)lineWidth andFirstColor:(UIColor *)firstColor andSecondColor:(UIColor *) secondColor ;

@end
