//
//  MDHomeRankCell.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/27.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDHomeRankCell.h"


@interface MDHomeRankCell ()

@property (nonatomic, strong) UILabel           *shopRankLabel;

@property (nonatomic, strong) UIImageView       *shopImageView;
@property (nonatomic, strong) UILabel           *shopNameLabel;
@property (nonatomic, strong) UIView            *shopScaleView;
@property (nonatomic, strong) UILabel           *shopOutputLabel;
@end


@implementation MDHomeRankCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = KColor_White;
        
        [self initSubView];
    }
    return self;
}


#pragma mark -- Pravite

- (void) initSubView{
    
    _shopRankLabel = [[UILabel alloc] init];
    _shopRankLabel.backgroundColor = KColor_White;
    _shopRankLabel.textAlignment = NSTextAlignmentCenter;
    _shopRankLabel.textColor = KColor_Gray_66;
    _shopRankLabel.font = [UIFont systemFontOfSize:18*kMainScaleMiunes];
    _shopRankLabel.text = @"12";
    [self.contentView addSubview:_shopRankLabel];
    [_shopRankLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(20*kMainScaleMiunes);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@(18*kMainScaleMiunes));
    }];
    
    _shopImageView = [[UIImageView alloc] init];
    _shopImageView.backgroundColor = KColor_White;
    [_shopImageView setImage:[UIImage imageNamed:@"icon_gold"]];
    _shopImageView.layer.cornerRadius = 3;
    _shopRankLabel.layer.masksToBounds = YES;
    [self.contentView addSubview:self.shopImageView];
    [self.shopImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(52*kMainScaleMiunes);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(35*kMainScaleMiunes, 29*kMainScaleMiunes));
    }];
    
    _shopNameLabel = [[UILabel alloc] init];
    _shopNameLabel.backgroundColor = KColor_White;
    _shopNameLabel.text = @"红黄蓝";
    _shopNameLabel.font = [UIFont systemFontOfSize:12*kMainScaleMiunes];
    _shopNameLabel.textColor = KColor_Gray_66;
    [self.contentView addSubview:_shopNameLabel];
    [_shopNameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_shopImageView.mas_right).offset(10*kMainScaleMiunes);
        make.top.equalTo(_shopImageView);
        make.size.mas_equalTo(CGSizeMake(150*kMainScaleMiunes, 12*kMainScaleMiunes));
    }];
    
    
    _shopScaleView = [[UIView alloc] init];
    _shopScaleView.backgroundColor = KColor_blue_97;
    _shopScaleView.layer.cornerRadius = 4*kMainScaleMiunes;
    _shopScaleView.layer.masksToBounds = YES;
    [self addSubview:_shopScaleView];
    [_shopScaleView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_shopNameLabel);
        make.top.equalTo(_shopNameLabel.mas_bottom).offset(10*kMainScaleMiunes);
        make.size.mas_equalTo(CGSizeMake(130*kMainScaleMiunes, 8*kMainScaleMiunes));
    }];
    
    
    _shopOutputLabel = [[UILabel alloc] init];
    _shopOutputLabel.backgroundColor = KColor_White;
    _shopOutputLabel.textColor = KColor_Gray_66;
    _shopOutputLabel.font = [UIFont systemFontOfSize:12*kMainScaleMiunes];
    _shopOutputLabel.text = @"2355145";
    [self.contentView addSubview:_shopOutputLabel];
    [_shopOutputLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-15*kMainScaleMiunes);
        make.top.equalTo(self.contentView).offset(15*kMainScaleMiunes);
    }];
    
}


@end
