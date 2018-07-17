//
//  CircleView.m
//  AnimationTest
//
//  Created by Tesla_Chen on 2017/11/23.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "CircleView.h"
#import "CircleLayer.h"

@interface CircleView ()

@property (nonatomic, strong, nullable) CircleLayer  *firstLayer;

@property (nonatomic, strong, nullable) CircleLayer  *secondLayer;

@end



@implementation CircleView

- (void) setCircleViewWithScale:(CGFloat) scale Radius:(CGFloat) radius LineWidth:(CGFloat)lineWidth andFirstColor:(UIColor *)firstColor andSecondColor:(UIColor *) secondColor
{

    CGFloat tempAngle = M_PI * 2 * scale;
    
    CGPoint  centerPoint = CGPointMake(CGRectGetMidX(self.frame)/2 + lineWidth/2, CGRectGetMidY(self.frame)/2 + lineWidth/2);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:(centerPoint) radius:radius startAngle:-M_PI_2 endAngle:tempAngle - M_PI_2 clockwise:YES];

    _firstLayer = [[CircleLayer alloc] init];
    _firstLayer.lineWidth = lineWidth;
    _firstLayer.strokeColor = firstColor.CGColor;
    _firstLayer.fillColor = nil;
    _firstLayer.path = path.CGPath;

    _firstLayer.strokeStart = 0;
    _firstLayer.strokeEnd = 0;

    [self.layer addSublayer:_firstLayer];
    
    
    UIBezierPath *pathTwo = [UIBezierPath bezierPathWithArcCenter:(centerPoint) radius:radius startAngle:M_PI + M_PI_2  endAngle:tempAngle - M_PI_2 clockwise:NO];
    
    _secondLayer = [[CircleLayer alloc] init];
    _secondLayer.lineWidth = lineWidth;
    _secondLayer.strokeColor = secondColor.CGColor;
    _secondLayer.fillColor = nil;
    _secondLayer.path = pathTwo.CGPath;
    
    _secondLayer.strokeStart = 0;
    _secondLayer.strokeEnd = 0;
    
    [self.layer addSublayer:_secondLayer];
    
    
    
    
}


@end
