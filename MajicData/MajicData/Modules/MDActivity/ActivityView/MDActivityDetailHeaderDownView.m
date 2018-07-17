//
//  MDActivityDetailHeaderDownView.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/30.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDActivityDetailHeaderDownView.h"
#import "CircleView.h"


@interface MDActivityDetailHeaderDownView ()

@property (nonatomic ,strong) CircleView    *circleView;

@property (nonatomic ,strong) UILabel   *newestVisiterLabel;

@property (nonatomic ,strong) UILabel   *oldVisiterLabel;

@property (nonatomic ,strong) UILabel   *exchangeLabel;

@property (nonatomic ,strong) UILabel   *newestSaleLabel;

@property (nonatomic ,strong) UILabel   *oldSaleLabel;

@property (nonatomic ,strong) UILabel   *refundLabel;



@end



@implementation MDActivityDetailHeaderDownView

- (void)initMDActivityDetailHeaderDownViewWithModel:(NSString *)model
{

    [self initView];
    
}


- (void)initView
{
    CGFloat newestValue = 55;
    CGFloat sale = 100;
    
    _circleView = [[CircleView alloc] init];
    _circleView.backgroundColor = KColor_White;
    _circleView.frame = CGRectMake(30*kMainScaleMiunes, 30*kMainScaleMiunes, 70*kMainScaleMiunes, 70*kMainScaleMiunes);
    [self addSubview:_circleView];
    [_circleView setCircleViewWithScale:newestValue / sale Radius:35.0*kMainScaleMiunes LineWidth:20*kMainScaleMiunes andFirstColor:KColor_Main andSecondColor:KColor_Green];
    
    UIView *newestView = [[UIView alloc] init];
    newestView.backgroundColor = KColor_Main;
    newestView.layer.cornerRadius = 2;
    newestView.layer.masksToBounds = YES;
    [self addSubview:newestView];
    [newestView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_circleView.mas_right).offset(30*kMainScaleMiunes);
        make.top.equalTo(self).offset(30*kMainScaleMiunes);
        make.size.mas_equalTo(CGSizeMake(15*kMainScaleMiunes, 15*kMainScaleMiunes));
    }];
    
    UILabel *newVisiter = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"新访客" Font:14*kMainScaleMiunes TextColor:KColor_Gray_99];
    [self addSubview:newVisiter];
    [newVisiter mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(newestView.mas_right).offset(8*kMainScaleMiunes);
        make.centerY.equalTo(newestView);
        make.height.equalTo(@(12*kMainScaleMiunes));
    }];
    
    
    _newestVisiterLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"55%" Font:14*kMainScaleMiunes TextColor:KColor_Main];
    [self addSubview:_newestVisiterLabel];
    [_newestVisiterLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(newVisiter.mas_right).offset(8*kMainScaleMiunes);
        make.centerY.equalTo(newVisiter);
        make.height.equalTo(@(12*kMainScaleMiunes));
    }];
    
    UILabel *newestSale = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"客单价" Font:14*kMainScaleMiunes TextColor:KColor_Gray_99];
    [self addSubview:newestSale];
    [newestSale mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(newVisiter.mas_right).offset(50*kMainScaleMiunes);
        make.centerY.equalTo(newVisiter);
        make.height.equalTo(@(12*kMainScaleMiunes));
    }];
    
    _newestSaleLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"2355.00" Font:14*kMainScaleMiunes TextColor:KColor_Main];
    [self addSubview:_newestSaleLabel];
    [_newestSaleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(newestSale.mas_right).offset(8*kMainScaleMiunes);
        make.centerY.equalTo(newVisiter);
        make.height.equalTo(@(12*kMainScaleMiunes));
    }];
    
    
    //老顾客
    UIView *oldView = [[UIView alloc] init];
    oldView.backgroundColor = KColor_Green;
    oldView.layer.cornerRadius = 2;
    oldView.layer.masksToBounds = YES;
    [self addSubview:oldView];
    [oldView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(newestView);
        make.top.equalTo(newestView.mas_bottom).offset(15*kMainScaleMiunes);
        make.size.mas_equalTo(CGSizeMake(15*kMainScaleMiunes, 15*kMainScaleMiunes));
    }];

    UILabel *oldVisiter = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"老顾客" Font:14*kMainScaleMiunes TextColor:KColor_Gray_99];
    [self addSubview:oldVisiter];
    [oldVisiter mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(oldView.mas_right).offset(8*kMainScaleMiunes);
        make.centerY.equalTo(oldView);
        make.height.equalTo(@(12*kMainScaleMiunes));
    }];
    
    
    _oldVisiterLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"45%" Font:14*kMainScaleMiunes TextColor:KColor_Green];
    [self addSubview:_oldVisiterLabel];
    [_oldVisiterLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(oldVisiter.mas_right).offset(8*kMainScaleMiunes);
        make.centerY.equalTo(oldVisiter);
        make.height.equalTo(@(12*kMainScaleMiunes));
    }];
    
    UILabel *oldSale = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"客单价" Font:14*kMainScaleMiunes TextColor:KColor_Gray_99];
    [self addSubview:oldSale];
    [oldSale mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(oldVisiter.mas_right).offset(50*kMainScaleMiunes);
        make.centerY.equalTo(oldVisiter);
        make.height.equalTo(@(12*kMainScaleMiunes));
    }];
    
    _oldSaleLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"1244.00" Font:14*kMainScaleMiunes TextColor:KColor_Green];
    [self addSubview:_oldSaleLabel];
    [_oldSaleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(oldSale.mas_right).offset(8*kMainScaleMiunes);
        make.centerY.equalTo(oldVisiter);
        make.height.equalTo(@(12*kMainScaleMiunes));
    }];
    
    
    UILabel *exchange = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"转化率" Font:14*kMainScaleMiunes TextColor:KColor_Gray_99];
    [self addSubview:exchange];
    [exchange mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(oldVisiter);
        make.top.equalTo(oldVisiter.mas_bottom).offset(15*kMainScaleMiunes);
        make.height.equalTo(@(12*kMainScaleMiunes));
    }];
    
    _exchangeLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"45%" Font:14*kMainScaleMiunes TextColor:KColor_Black];
    [self addSubview:_exchangeLabel];
    [_exchangeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(exchange.mas_right).offset(8*kMainScaleMiunes);
        make.centerY.equalTo(exchange);
        make.height.equalTo(@(12*kMainScaleMiunes));
    }];
    
    UILabel *refund = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"退款率" Font:14*kMainScaleMiunes TextColor:KColor_Gray_99];
    [self addSubview:refund];
    [refund mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(exchange.mas_right).offset(50*kMainScaleMiunes);
        make.centerY.equalTo(exchange);
        make.height.equalTo(@(12*kMainScaleMiunes));
    }];
    
    _refundLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"0.00%" Font:14*kMainScaleMiunes TextColor:KColor_Black];
    [self addSubview:_refundLabel];
    [_refundLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(refund.mas_right).offset(8*kMainScaleMiunes);
        make.centerY.equalTo(exchange);
        make.height.equalTo(@(12*kMainScaleMiunes));
    }];
    
    
}

@end
