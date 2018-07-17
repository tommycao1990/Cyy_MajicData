//
//  MDMixDataView.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/27.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDMixDataView.h"
#import "CircleView.h"


@interface MDMixDataView ()

@property (nonatomic, strong) MDMixDataViewSetting  *setting;

@property (nonatomic, strong) CircleView            *circleView;

@end


@implementation MDMixDataView

- (instancetype) initMDMixDataViewWithSetting:(MDMixDataViewSetting *)setting {
    self = [super initWithFrame:setting.frame];
    if (self) {
       
        _setting = setting;
        
        [self initView];
        
    }
    
    return self;
}


#pragma mark -- initView

- (void)initView {
    
    
    CGFloat juHuaSuanOutput = [_setting.juHuaSuanOutput floatValue];
    CGFloat sale = [_setting.sale floatValue];
    
    _circleView = [[CircleView alloc] init];
    _circleView.backgroundColor = KColor_White;
    _circleView.frame = CGRectMake(31, 45, 150*kMainScaleMiunes, 150*kMainScaleMiunes);
    [self addSubview:_circleView];
    [_circleView setCircleViewWithScale:juHuaSuanOutput / sale Radius:57.5*kMainScaleMiunes LineWidth:35*kMainScaleMiunes andFirstColor:KColor_Main andSecondColor:KColor_Green];
    
    
    CGFloat leftMargain = CGRectGetMaxX(self.circleView.frame)+30;
    
    UILabel *saleLabel = [self setLabelPropertyWith:@"销售额" Font:12*kMainScaleMiunes TextColor:KColor_Gray_66];
    saleLabel.frame = CGRectMake(leftMargain, 32, 60, 12*kMainScaleMiunes);
    [self addSubview:saleLabel];
    
    UILabel *saleValuelabel = [self setLabelPropertyWith:_setting.sale Font:20*kMainScaleMiunes TextColor:_setting.saleColor];
    saleValuelabel.frame = CGRectMake(leftMargain, CGRectGetMaxY(saleLabel.frame)+6*kMainScaleMiunes, 100*kMainScaleMiunes, 20*kMainScaleMiunes);
    [self addSubview:saleValuelabel];
    
    UILabel *ju_Label = [self setLabelPropertyWith:@"聚划算产出" Font:12*kMainScaleMiunes TextColor:KColor_Gray_66];

    ju_Label.frame = CGRectMake(leftMargain, CGRectGetMaxY(saleValuelabel.frame)+24*kMainScaleMiunes, 100*kMainScaleMiunes, 12*kMainScaleMiunes);
    [self addSubview:ju_Label];
    
    UILabel *ju_Output_Label = [self setLabelPropertyWith:_setting.juHuaSuanOutput Font:20*kMainScaleMiunes TextColor:KColor_Main];
    ju_Output_Label.frame = CGRectMake(leftMargain, CGRectGetMaxY(ju_Label.frame)+6*kMainScaleMiunes, 100*kMainScaleMiunes, 20*kMainScaleMiunes);
    [self addSubview:ju_Output_Label];
    
    UILabel *ju_OutputTimes_Label = [self setLabelPropertyWith:[NSString stringWithFormat:@"场次 %@", _setting.juHuaSuanTimes] Font:10*kMainScaleMiunes TextColor:KColor_Gray_99];
    ju_OutputTimes_Label.frame = CGRectMake(leftMargain, CGRectGetMaxY(ju_Output_Label.frame)+4*kMainScaleMiunes, 40*kMainScaleMiunes, 10*kMainScaleMiunes);
    [self addSubview:ju_OutputTimes_Label];
    
    UILabel *ju_OutputAverage_Label = [self setLabelPropertyWith:[NSString stringWithFormat:@"均产 %@", _setting.juHuaSuanAverage] Font:10*kMainScaleMiunes TextColor:KColor_Gray_99];
    ju_OutputAverage_Label.frame = CGRectMake(CGRectGetMaxX(ju_OutputTimes_Label.frame)+8*kMainScaleMiunes, CGRectGetMinY(ju_OutputTimes_Label.frame), 100, 10*kMainScaleMiunes);
    [self addSubview:ju_OutputAverage_Label];
    
    UILabel *panic_Label = [self setLabelPropertyWith:@"抢购产出" Font:12*kMainScaleMiunes TextColor:KColor_Gray_66];
    panic_Label.frame = CGRectMake(leftMargain, CGRectGetMaxY(ju_OutputTimes_Label.frame)+10*kMainScaleMiunes, 100*kMainScaleMiunes, 12*kMainScaleMiunes);
    [self addSubview:panic_Label];
    
    UILabel *panic_Output_Label = [self setLabelPropertyWith:_setting.panicPurchaseOutput Font:20*kMainScaleMiunes TextColor:KColor_Green];
    panic_Output_Label.frame = CGRectMake(leftMargain, CGRectGetMaxY(panic_Label.frame)+6*kMainScaleMiunes, 120, 20*kMainScaleMiunes);
    [self addSubview:panic_Output_Label];
    
    UILabel *panic_Times_Label = [self setLabelPropertyWith:[NSString stringWithFormat:@"场次 %@", _setting.panicPurchaseTimes] Font:10*kMainScaleMiunes TextColor:KColor_Gray_99];
    panic_Times_Label.frame = CGRectMake(leftMargain, CGRectGetMaxY(panic_Output_Label.frame)+4*kMainScaleMiunes, 40*kMainScaleMiunes, 10*kMainScaleMiunes);
    [self addSubview:panic_Times_Label];
    
    UILabel *panic_Aaverage_Label = [self setLabelPropertyWith:[NSString stringWithFormat:@"均产 %@", _setting.panicPurchaseAverage] Font:10*kMainScaleMiunes TextColor:KColor_Gray_99];
    panic_Aaverage_Label.frame = CGRectMake(CGRectGetMaxX(panic_Times_Label.frame)+8*kMainScaleMiunes, CGRectGetMinY(panic_Times_Label.frame), 100*kMainScaleMiunes, 10*kMainScaleMiunes);
    [self addSubview:panic_Aaverage_Label];

}


- (UILabel *) setLabelPropertyWith:(NSString *)title Font:(CGFloat) size TextColor:(UIColor *)textcolor {
    UILabel *testLabel = [[UILabel alloc] init];
    [testLabel setBackgroundColor: KColor_White];
    
    [testLabel setFont:[UIFont systemFontOfSize:size]];
    [testLabel setTextColor:textcolor];
    [testLabel setText:[NSString stringWithFormat:@"%@",title]];
    return  testLabel;
}



@end





@implementation MDMixDataViewSetting

@end
