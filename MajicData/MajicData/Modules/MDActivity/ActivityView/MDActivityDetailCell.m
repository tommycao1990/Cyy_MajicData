//
//  MDActivityDetailCell.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/29.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDActivityDetailCell.h"


@interface MDActivityDetailCell ()

@property (nonatomic, strong) UIImageView   *productImageView;
@property (nonatomic, strong) UILabel       *proIdLabel;
@property (nonatomic, strong) UILabel       *proNameLabel;
@property (nonatomic, strong) UILabel       *priceLabel;
@property (nonatomic, strong) UILabel       *numLabel;
@property (nonatomic, strong) UILabel       *totalPriceLabel;

@end


@implementation MDActivityDetailCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = KColor_White;
        [self initMDActivityDetailCellView];
        
    }
    return self;
}

#pragma mark -- initView

- (void)initMDActivityDetailCellView
{
    _productImageView = [[UIImageView alloc] init];
    [_productImageView setImage:[UIImage imageNamed:@"HomeShop"]];
    [self.contentView addSubview:_productImageView];
    [_productImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(15*kMainScaleMiunes));
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(80*kMainScaleMiunes, 80*kMainScaleMiunes));
    }];
    
    _proIdLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"ID:2356745" Font:12*kMainScaleMiunes TextColor:KColor_Black_Main];
    [self.contentView addSubview:_proIdLabel];
    [_proIdLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_productImageView.mas_right).offset(10*kMainScaleMiunes);
        make.top.equalTo(_productImageView).offset(2*kMainScaleMiunes);
        make.height.equalTo(@(12*kMainScaleMiunes));
    }];
    
    _proNameLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"花花公子羊毛大衣男士呢子风衣" Font:14*kMainScaleMiunes TextColor:KColor_Black_Main];
    [self.contentView addSubview:_proNameLabel];
    [_proNameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_proIdLabel);
        make.top.equalTo(_proIdLabel.mas_bottom).offset(6*kMainScaleMiunes);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
    UILabel *activity = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"活动价" Font:12*kMainScaleMiunes TextColor:KColor_Gray_99];
    [self.contentView addSubview:activity];
    [activity mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_proNameLabel);
        make.top.equalTo(_proNameLabel.mas_bottom).offset(12*kMainScaleMiunes);
        make.height.equalTo(@(12*kMainScaleMiunes));
    }];
    
    _priceLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"¥361" Font:14*kMainScaleMiunes TextColor:KColor_Black];
    [self.contentView addSubview:_priceLabel];
    [_priceLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(activity);
        make.top.equalTo(activity.mas_bottom).offset(12*kMainScaleMiunes);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
    UILabel *numberLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"报名数量" Font:12*kMainScaleMiunes TextColor:KColor_Gray_99];
    [self.contentView addSubview:numberLabel];
    [numberLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(activity.mas_right).offset(30*kMainScaleMiunes);
        make.centerY.equalTo(activity);
        make.height.equalTo(@(12*kMainScaleMiunes));
    }];
    
    _numLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"712" Font:14*kMainScaleMiunes TextColor:KColor_Black];
    [self.contentView addSubview:_numLabel];
    [_numLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(numberLabel);
        make.centerY.equalTo(_priceLabel);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
    UILabel *total = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"货值" Font:12*kMainScaleMiunes TextColor:KColor_Gray_99];
    [self.contentView addSubview:total];
    [total mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(numberLabel.mas_right).offset(30*kMainScaleMiunes);
        make.centerY.equalTo(numberLabel);
        make.height.equalTo(@(12*kMainScaleMiunes));
    }];
    
    _totalPriceLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"¥124556" Font:14*kMainScaleMiunes TextColor:KColor_Black];
    [self.contentView addSubview:_totalPriceLabel];
    [_totalPriceLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(total);
        make.centerY.equalTo(_numLabel);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
    
    
    
    
    
}



@end
