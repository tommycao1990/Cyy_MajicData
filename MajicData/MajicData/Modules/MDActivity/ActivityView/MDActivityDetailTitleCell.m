//
//  MDActivityDetailTitleCell.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/30.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDActivityDetailTitleCell.h"

@interface MDActivityDetailTitleCell ()


@property (nonatomic, strong) UILabel       *leftLabel;

@property (nonatomic, strong) UILabel       *rightLabel;

@end


@implementation MDActivityDetailTitleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self initMDActivityDetailTitleCellView];
        
    }
    return self;
}

#pragma mark -- initView

- (void)initMDActivityDetailTitleCellView
{
    _leftLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"" Font:14*kMainScaleMiunes TextColor:KColor_Gray_99];
    [self.contentView addSubview:_leftLabel];
    [_leftLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15*kMainScaleMiunes);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
    _rightLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"" Font:14*kMainScaleMiunes TextColor:KColor_Black_Main];
    [self.contentView addSubview:_rightLabel];
    [_rightLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftLabel.mas_right).offset(20*kMainScaleMiunes);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
}

-(void)setLeftStr:(NSString *)leftStr
{
    _leftStr = leftStr;
    [_leftLabel setText:leftStr];
}

-(void)setRightStr:(NSString *)rightStr
{
    _rightStr = rightStr;
    [_rightLabel setText:rightStr];
}



@end
