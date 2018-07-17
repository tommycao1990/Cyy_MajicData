//
//  MDActivityListCell.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/29.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDActivityListCell.h"

@interface MDActivityListCell ()


@property (nonatomic, strong) UILabel       *ownerLabel;

@property (nonatomic, strong) UILabel       *timelabel;

@property (nonatomic, strong) UILabel       *titleLabel;

@property (nonatomic, strong) UILabel       *shopNamelabel;

@property (nonatomic, strong) UILabel       *shopTypeLabel;

@property (nonatomic, strong) UILabel       *saleLabel;

@end


@implementation MDActivityListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initMDActivityListCellView];
    }
    return self;
}

#pragma mark -- initView

- (void)initMDActivityListCellView
{
    [self.contentView addSubview:self.ownerLabel];
    [self.contentView addSubview:self.timelabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.shopNamelabel];
    [self.contentView addSubview:self.shopTypeLabel];
    [self.contentView addSubview:self.saleLabel];
    
    
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = KColor_Gray;
    [self.contentView addSubview:topView];
    [topView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.height.equalTo(@(10*kMainScaleMiunes));
    }];
    
    [self.ownerLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(25*kMainScaleMiunes);
        make.top.equalTo(topView.mas_bottom).offset(10*kMainScaleMiunes);
        make.height.equalTo(@(16*kMainScaleMiunes));
        make.width.equalTo(@(32*kMainScaleMiunes));
    }];
    
    [self.timelabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.ownerLabel.mas_right).offset(10*kMainScaleMiunes);
        make.centerY.equalTo(self.ownerLabel);
        make.height.equalTo(@(16*kMainScaleMiunes));
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timelabel.mas_right).offset(15*kMainScaleMiunes);
        make.centerY.equalTo(self.timelabel);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
    UIButton *moreButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    moreButton.backgroundColor = KColor_White;
    [moreButton addTarget:self action:@selector(moreButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [moreButton setTitle:@"更多 >" forState:(UIControlStateNormal)];
    [moreButton setTitleColor:KColor_Gray_99 forState:(UIControlStateNormal)];
    [moreButton.titleLabel setFont:[UIFont systemFontOfSize:12*kMainScaleMiunes]];
//    [moreButton setContentEdgeInsets:(UIEdgeInsetsMake(5, 10, 5, 0))];
    [self.contentView addSubview:moreButton];
    [moreButton mas_remakeConstraints:^(MASConstraintMaker *make) {
     make.right.equalTo(self.contentView.mas_right).offset(-25*kMainScaleMiunes);
        make.centerY.equalTo(self.ownerLabel);
        make.size.mas_equalTo(CGSizeMake(42, 22));
    }];
    
    UIView *lineHorView = [[UIView alloc] init];
    lineHorView.backgroundColor = UIColorFromRGB(0XE5E5E5);
    [self.contentView addSubview:lineHorView];
    [lineHorView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.ownerLabel.mas_bottom).offset(12*kMainScaleMiunes);
        make.left.equalTo(self.ownerLabel);
        make.right.equalTo(moreButton);
        make.height.equalTo(@(1));
    }];
    
    [self.shopNamelabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineHorView.mas_bottom).offset(25*kMainScaleMiunes);
        make.left.equalTo(lineHorView);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
    [self.shopTypeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shopNamelabel);
        make.top.equalTo(self.shopNamelabel.mas_bottom).offset(10*kMainScaleMiunes);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
    UIView *centerLineView = [[UIView alloc] init];
    centerLineView.backgroundColor = KColor_Gray_99;
    [self.contentView addSubview:centerLineView];
    [centerLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineHorView.mas_bottom).offset(23*kMainScaleMiunes);
        make.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(1, 40*kMainScaleMiunes));
    }];
    
    [self.saleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(centerLineView.mas_right).offset(30*kMainScaleMiunes);
        make.centerY.equalTo(self.shopNamelabel);
        make.height.equalTo(@(18*kMainScaleMiunes));
    }];
    
    UILabel *saleTitleLabel = [[UILabel alloc] init];
    saleTitleLabel.backgroundColor = KColor_White;
    saleTitleLabel.font = [UIFont systemFontOfSize:10*kMainScaleMiunes];
    saleTitleLabel.textColor = KColor_Gray_99;
    saleTitleLabel.text = @"销售额";
    [self.contentView addSubview:saleTitleLabel];
    [saleTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.saleLabel);
        make.top.equalTo(self.saleLabel.mas_bottom).offset(8*kMainScaleMiunes);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
}

#pragma mark -- Lazy Load

- (UILabel *)ownerLabel {
    
    if (!_ownerLabel) {
        
        _ownerLabel = [[UILabel alloc] init];
        _ownerLabel.backgroundColor = KColor_Main;
        _ownerLabel.textAlignment = NSTextAlignmentCenter;
        _ownerLabel.textColor = KColor_White;
        _ownerLabel.font = [UIFont systemFontOfSize:10*kMainScaleMiunes];
        _ownerLabel.layer.cornerRadius = 8*kMainScaleMiunes;
        _ownerLabel.layer.masksToBounds = YES;
        
    }
    return _ownerLabel;
}

- (UILabel *)timelabel {
    
    if (!_timelabel) {
        _timelabel = [[UILabel alloc] init];
        [_timelabel setBackgroundColor: KColor_White];
        [_timelabel setFont:[UIFont systemFontOfSize:14*kMainScaleMiunes]];
        [_timelabel setTextColor:KColor_Gray_66];
    }
    return _timelabel;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setBackgroundColor: KColor_White];
        
        [_titleLabel setFont:[UIFont systemFontOfSize:14*kMainScaleMiunes weight:.3f]];
        [_titleLabel setTextColor:KColor_Gray_66];
    }
    return _titleLabel;
}

- (UILabel *)shopNamelabel {
    if (!_shopNamelabel) {
        _shopNamelabel = [[UILabel alloc] init];
        [_shopNamelabel setBackgroundColor: KColor_White];
        
        [_shopNamelabel setFont:[UIFont systemFontOfSize:14*kMainScaleMiunes]];
        [_shopNamelabel setTextColor:KColor_Gray_66];
    }
    return _shopNamelabel;
}

- (UILabel *)shopTypeLabel {
    
    if (!_shopTypeLabel) {
        _shopTypeLabel = [[UILabel alloc] init];
        [_shopTypeLabel setBackgroundColor: KColor_White];
        
        [_shopTypeLabel setFont:[UIFont systemFontOfSize:10*kMainScaleMiunes]];
        [_shopTypeLabel setTextColor:KColor_Gray_99];
    }
    return _shopTypeLabel;
}

- (UILabel *)saleLabel {
    if (!_saleLabel) {
        _saleLabel = [[UILabel alloc] init];
        [_saleLabel setBackgroundColor: KColor_White];
        
        [_saleLabel setFont:[UIFont systemFontOfSize:18*kMainScaleMiunes]];
        [_saleLabel setTextColor:KColor_Main];
    }
    return _saleLabel;
}


#pragma mark -- setter

-(void)setListModel:(MDActivityListModel *)listModel
{
    _listModel = listModel;
    
    [self.ownerLabel setText:listModel.ownerName];
    [self.timelabel setText:listModel.time];
    [self.titleLabel setText:listModel.title];
    [self.shopNamelabel setText:listModel.shopName];
    [self.shopTypeLabel setText:listModel.shopType];
    [self.saleLabel setText:listModel.sale];
    
}

#pragma mark -- Pravite Method

- (void)moreButtonAction:(UIButton *)sender
{
    
}


@end
