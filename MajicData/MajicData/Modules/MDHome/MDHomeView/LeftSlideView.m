//
//  LeftSlideView.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/12/1.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "LeftSlideView.h"



@implementation LeftSlideView

- (void)initlifeSlideViewWithGroups:(NSArray *)groups
{
    
    static CGFloat buttonHeight = 50;
    
    UIButton *allButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    allButton.backgroundColor = UIColorFromRGB(0X333843);
    allButton.frame = CGRectMake(0, 64 + 35*kMainScaleMiunes, self.frame.size.width, buttonHeight*kMainScaleMiunes);
    allButton.tag = 0;
    [allButton setTitle:@"全部" forState:(UIControlStateNormal)];
    [allButton setTitleColor:KColor_White forState:(UIControlStateNormal)];
    [allButton addTarget:self action:@selector(selectButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:allButton];
    
    if (groups.count < 1) {
        return;
    }
    
    for (int i = 0; i < groups.count; i++) {
        UIButton *groupButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        groupButton.backgroundColor = UIColorFromRGB(0X333843);
        groupButton.frame = CGRectMake(0, 64 + 35*kMainScaleMiunes +(i+1)*buttonHeight*kMainScaleMiunes, self.frame.size.width, buttonHeight*kMainScaleMiunes);
        groupButton.tag = i+1;
        [groupButton setTitle:[NSString stringWithFormat:@"%@",groups[i]] forState:(UIControlStateNormal)];
        [groupButton setTitleColor:KColor_White forState:(UIControlStateNormal)];
        [groupButton addTarget:self action:@selector(selectButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:groupButton];
    }
    
    
}




- (void)selectButtonAction:(UIButton *)sender
{
    
    if (_selectIndex) {
        _selectIndex(sender.tag);
    }
    
}

@end
