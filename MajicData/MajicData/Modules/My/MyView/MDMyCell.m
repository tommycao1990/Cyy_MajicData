//
//  MDMyCell.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/30.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDMyCell.h"

@interface MDMyCell ()

@property (nonatomic, strong) UIImageView       *shopIconIamgeView;
@property (nonatomic, strong) UILabel           *shopNameLabel;

@end


@implementation MDMyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initMDMyCellView];
    }
    return self;
}

#pragma mark -- initCellView

- (void)initMDMyCellView
{
    _shopIconIamgeView = [[UIImageView alloc] init];
    _shopIconIamgeView.backgroundColor = KColor_White;
    [_shopIconIamgeView setImage:[UIImage imageNamed:@"HomeShop"]];
    [self.contentView addSubview:_shopIconIamgeView];
    [_shopIconIamgeView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15*kMainScaleMiunes);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(35*kMainScaleMiunes, 35*kMainScaleMiunes));
    }];
    
    _shopNameLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"花花公子格为" Font:14*kMainScaleMiunes TextColor:KColor_Gray_66];
    [self.contentView addSubview:_shopNameLabel];
    [_shopNameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_shopIconIamgeView.mas_right).offset(10*kMainScaleMiunes);
        make.centerY.equalTo(_shopIconIamgeView);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
}

@end
