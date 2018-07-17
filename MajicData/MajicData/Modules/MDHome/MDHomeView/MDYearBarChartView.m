//
//  MDYearBarChartView.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/28.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDYearBarChartView.h"
#import "MDBarChartLayer.h"



@interface MDYearBarChartView ()

@property (nonatomic, strong) MDYearBarChartViewSetting *setting;


@property (nonatomic, strong) NSMutableArray        *buttonArray;

@end



@implementation MDYearBarChartView


-(NSMutableArray *)buttonArray
{
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}

- (instancetype)initMDYearBarChartViewWithSetting:(MDYearBarChartViewSetting *) setting
{
    self = [super initWithFrame:setting.frame];
    if (self) {
        _setting = setting;
        
        [self initMDYearBarChartSubviews];
    }
    return self;
}

#pragma mark -- initView
- (void)initMDYearBarChartSubviews {
    
    
    NSMutableArray *labelArray = [NSMutableArray array];
    
    CGFloat padding = 5*kMainScaleMiunes;
    CGFloat buttonWidth = (kMainWidth - 2*padding)/12;
    
    for (int i = 0; i < 12; i ++) {
        
        UIButton *barChartButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        barChartButton.backgroundColor = KColor_White;
        [barChartButton addTarget:self action:@selector(barChartButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        barChartButton.tag = i+1;
        
        barChartButton.frame = CGRectMake(padding + i * buttonWidth, 15*kMainScaleMiunes, buttonWidth, 100*kMainScaleMiunes);
        
        if (_setting.dataArray.count-1 >= i) {
            
            MDBarChartLayer *barChartlayer = [[MDBarChartLayer alloc] init];
            barChartlayer.backgroundColor = [UIColor whiteColor].CGColor;
            barChartlayer.frame = CGRectMake(padding + buttonWidth/2 - 4*kMainScaleMiunes, 0, 8*kMainScaleMiunes, 100*kMainScaleMiunes);
            //        barChartlayer.position = barChartButton.center;
            barChartlayer.strokeColor = KColor_Main.CGColor;
            barChartlayer.fillColor = nil;
            barChartlayer.lineWidth = 8*kMainScaleMiunes;
            barChartlayer.strokeEnd = 0;
            barChartlayer.strokeStart = 0;
            
            CGFloat last = 100 - [_setting.dataArray[i] floatValue];
            
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:(CGPointMake(0, 100*kMainScaleMiunes))];//起点
            [path addLineToPoint:(CGPointMake(0,last*kMainScaleMiunes))];//终点
            barChartlayer.path = path.CGPath;
            [barChartButton.layer addSublayer:barChartlayer];
        }
        
        [self addSubview:barChartButton];
        [self.buttonArray addObject:barChartButton];
        
        UILabel *monthLabel = [[UILabel alloc] init];
        monthLabel.backgroundColor = KColor_White;
        monthLabel.textAlignment = NSTextAlignmentCenter;
        monthLabel.text = @"1月";
        monthLabel.textColor = KColor_Gray_66;
        monthLabel.font = [UIFont systemFontOfSize:16*kMainScaleMiunes];
        [self addSubview:monthLabel];
        [labelArray addObject:monthLabel];
    }
    
    [labelArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:6*kMainScaleMiunes tailSpacing:6*kMainScaleMiunes];
    
    [labelArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(-15*kMainScaleMiunes);
        make.height.equalTo(@(16*kMainScaleMiunes));
    }];
    
}

#pragma mark -- Pravite Method




- (void)barChartButtonAction:(UIButton *)sender {
    
    NSLog(@"%ld",sender.tag);
    
}

@end

@implementation MDYearBarChartViewSetting


@end;


