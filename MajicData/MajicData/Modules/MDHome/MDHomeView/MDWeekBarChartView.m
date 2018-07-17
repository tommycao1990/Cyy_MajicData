//
//  MDWeekBarChartView.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/28.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDWeekBarChartView.h"
#import "MDBarChartLayer.h"


@interface MDWeekBarChartView ()

@property (nonatomic, strong) MDWeekBarChartViewSetting *setting;

@end


@implementation MDWeekBarChartView

- (instancetype)initMDWeekBarChartViewWithSetting:(MDWeekBarChartViewSetting *) setting
{
    
    self = [super initWithFrame:setting.frame];
    
    if (self) {
        
        _setting = setting;
        
        [self initMDWeekBarChartView];
        
    }
    
    return self;
}


#pragma mark -- initView

- (void)initMDWeekBarChartView {
    
    NSMutableArray *labelArray = [NSMutableArray array];
    CGFloat padding = 20*kMainScaleMiunes;
    CGFloat buttonWidth = (kMainWidth - 2*padding)/7;
    
    for (int i = 0; i < 7; i++) {
        
        UIButton *barChartButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        barChartButton.backgroundColor = KColor_White;
        barChartButton.tag = i+1;
        [barChartButton addTarget:self
                           action:@selector(barChartButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        barChartButton.frame = CGRectMake(padding + buttonWidth * i, 15*kMainScaleMiunes, buttonWidth, 100*kMainScaleMiunes);
        
        if (_setting.dataArray.count-1 >= i) {
            
        
        NSArray *scaleArray = _setting.dataArray[i];

        
        MDBarChartLayer *barChartLayer_left = [[MDBarChartLayer alloc] init];
        barChartLayer_left.backgroundColor = KColor_White.CGColor;
        barChartLayer_left.frame = CGRectMake(20*kMainScaleMiunes, 0, 10*kMainScaleMiunes, 100*kMainScaleMiunes);
        barChartLayer_left.strokeColor = KColor_Main.CGColor;
        barChartLayer_left.fillColor = nil;
        barChartLayer_left.lineWidth = 10*kMainScaleMiunes;
        barChartLayer_left.strokeEnd = 0;
        barChartLayer_left.strokeStart = 0;
        
        
        CGFloat scale_left = 100 - [scaleArray[0] floatValue];
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:(CGPointMake(0, 100*kMainScaleMiunes))];//起点
        [path addLineToPoint:(CGPointMake(0,scale_left*kMainScaleMiunes))];//终点
        barChartLayer_left.path = path.CGPath;
        [barChartButton.layer addSublayer:barChartLayer_left];
        
        
        MDBarChartLayer *barChartLayer_right = [[MDBarChartLayer alloc] init];
        barChartLayer_right.backgroundColor = KColor_White.CGColor;
        barChartLayer_right.frame = CGRectMake(35*kMainScaleMiunes, 0, 10*kMainScaleMiunes, 100*kMainScaleMiunes);
        barChartLayer_right.strokeColor = KColor_Green.CGColor;
        barChartLayer_right.fillColor = nil;
        barChartLayer_right.lineWidth = 10*kMainScaleMiunes;
        barChartLayer_right.strokeEnd = 0;
        barChartLayer_right.strokeStart = 0;
        
        CGFloat scale_right = 100 - [scaleArray[1] floatValue];
        
        UIBezierPath *path_right = [UIBezierPath bezierPath];
        [path_right moveToPoint:(CGPointMake(0, 100*kMainScaleMiunes))];//起点
        [path_right addLineToPoint:(CGPointMake(0,scale_right*kMainScaleMiunes))];//终点
        barChartLayer_right.path = path_right.CGPath;
        [barChartButton.layer addSublayer:barChartLayer_right];
        
        }
        [self addSubview:barChartButton];

        
        UILabel *dayLabel = [[UILabel alloc] init];
        dayLabel.backgroundColor = KColor_White;
        dayLabel.textAlignment = NSTextAlignmentCenter;
        dayLabel.text = @"9/23";
        dayLabel.textColor = KColor_Gray_99;
        dayLabel.font = [UIFont systemFontOfSize:10*kMainScaleMiunes];
        [self addSubview:dayLabel];
        [labelArray addObject:dayLabel];
        
    }
    
    [labelArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:padding tailSpacing:padding];
    
    [labelArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(-15*kMainScaleMiunes);
        make.height.equalTo(@(12*kMainScaleMiunes));
    }];
    
    
}


#pragma mark -- Parvite Method

- (void)barChartButtonAction:(UIButton *) sender
{
    
    NSLog(@"%ld",sender.tag);
    
}


@end


@implementation MDWeekBarChartViewSetting


@end
