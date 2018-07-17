//
//  MDActivityDetailHeaderTopView.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/30.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDActivityDetailHeaderTopView.h"


@interface MDActivityDetailHeaderTopView ()

@property (nonatomic, strong) UILabel       *saleCountLabel;

@property (nonatomic, strong) UILabel       *orderNumLabel;

@property (nonatomic, strong) UILabel       *dealNumLabel;

@property (nonatomic, strong) UILabel       *visiterNumLabel;

@property (nonatomic, strong) UILabel       *averageSaleLabel;

@end


@implementation MDActivityDetailHeaderTopView


- (void)setMDActivityDetailHeaderTopViewSubviewsWith:(NSString *)model
{
    
    [self initView];
    
}


- (void)initView
{
    
    UILabel *saleTitleLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"总销售额" Font:14*kMainScaleMiunes TextColor:KColor_Gray_66];
    saleTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:saleTitleLabel];
    [saleTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(15*kMainScaleMiunes);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
    _saleCountLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"224,415.00" Font:28*kMainScaleMiunes TextColor:KColor_Main];
    _saleCountLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_saleCountLabel];
    [_saleCountLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(saleTitleLabel.mas_bottom).offset(15*kMainScaleMiunes);
        make.centerX.equalTo(self);
        make.height.equalTo(@(28*kMainScaleMiunes));
    }];
    
    CGFloat labelWidth = kMainWidth/4;
    
    UILabel *orderLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"订单数" Font:12*kMainScaleMiunes TextColor:KColor_Gray_99];
    orderLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:orderLabel];
    [orderLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_saleCountLabel.mas_bottom).offset(20*kMainScaleMiunes);
        make.left.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(labelWidth, 17*kMainScaleMiunes));
    }];
    
    UILabel *dealLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"成交件数" Font:12*kMainScaleMiunes TextColor:KColor_Gray_99];
    dealLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:dealLabel];
    [dealLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_saleCountLabel.mas_bottom).offset(20*kMainScaleMiunes);
        make.left.equalTo(orderLabel.mas_right);
        make.size.mas_equalTo(CGSizeMake(labelWidth, 17*kMainScaleMiunes));
    }];
    
    UILabel *visiterLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"访客数" Font:12*kMainScaleMiunes TextColor:KColor_Gray_99];
    visiterLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:visiterLabel];
    [visiterLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_saleCountLabel.mas_bottom).offset(20*kMainScaleMiunes);
        make.left.equalTo(dealLabel.mas_right);
        make.size.mas_equalTo(CGSizeMake(labelWidth, 17*kMainScaleMiunes));
    }];
    
    UILabel *averageLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"平均客单价" Font:12*kMainScaleMiunes TextColor:KColor_Gray_99];
    averageLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:averageLabel];
    [averageLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_saleCountLabel.mas_bottom).offset(20*kMainScaleMiunes);
        make.left.equalTo(visiterLabel.mas_right);
        make.size.mas_equalTo(CGSizeMake(labelWidth, 17*kMainScaleMiunes));
    }];
    
    _orderNumLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"4356" Font:22*kMainScaleMiunes TextColor:KColor_Black_Main];
    _orderNumLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_orderNumLabel];
    [_orderNumLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(orderLabel.mas_bottom).offset(10*kMainScaleMiunes);
        make.left.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(labelWidth, 22*kMainScaleMiunes));
    }];
    
    _dealNumLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"4987" Font:22*kMainScaleMiunes TextColor:KColor_Black_Main];
    _dealNumLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_dealNumLabel];
    [_dealNumLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(orderLabel.mas_bottom).offset(10*kMainScaleMiunes);
        make.left.equalTo(_orderNumLabel.mas_right);
        make.size.mas_equalTo(CGSizeMake(labelWidth, 22*kMainScaleMiunes));
    }];
    
    _visiterNumLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"9756" Font:22*kMainScaleMiunes TextColor:KColor_Black_Main];
    _visiterNumLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_visiterNumLabel];
    [_visiterNumLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(orderLabel.mas_bottom).offset(10*kMainScaleMiunes);
        make.left.equalTo(_dealNumLabel.mas_right);
        make.size.mas_equalTo(CGSizeMake(labelWidth, 22*kMainScaleMiunes));
    }];
    
    _averageSaleLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"256" Font:22*kMainScaleMiunes TextColor:KColor_Black_Main];
    _averageSaleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_averageSaleLabel];
    [_averageSaleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(orderLabel.mas_bottom).offset(10*kMainScaleMiunes);
        make.left.equalTo(_visiterNumLabel.mas_right);
        make.size.mas_equalTo(CGSizeMake(labelWidth, 22*kMainScaleMiunes));
    }];
    
}




@end
