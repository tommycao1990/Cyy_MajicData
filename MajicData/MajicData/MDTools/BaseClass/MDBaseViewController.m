//
//  MDBaseViewController.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/22.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDBaseViewController.h"

@interface MDBaseViewController ()

@property (nonatomic, strong) UIButton *navLeftBtn;
@property (nonatomic, strong) UIButton *navRightBtn;

@end

@implementation MDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:KColor_White];
    
}

#pragma mark -- Pravite Method

- (void)setbackItem
{
    
    UIButton *backButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [backButton setBackgroundColor:KColor_Main];
    backButton.frame = CGRectMake(15*kMainScaleMiunes, 10, 70*kMainScaleMiunes, 35);
    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    UIImageView *backImageView = [[UIImageView alloc] init];
    [backImageView setImage:[UIImage imageNamed:@"back_white"]];
    [backButton addSubview:backImageView];
    [backImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backButton);
        make.centerY.equalTo(backButton);
        make.size.mas_equalTo(CGSizeMake(20*kMainScaleMiunes, 20*kMainScaleMiunes));
    }];

    UILabel *backLabel = [[UILabel alloc] init];
    backLabel.backgroundColor = KColor_Main;
    [backLabel setText:@"返回"];
    backLabel.font = [UIFont systemFontOfSize:17*kMainScaleMiunes];
    backLabel.textColor = KColor_White;
    [backButton addSubview:backLabel];
    [backLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backImageView.mas_right).offset(2*kMainScaleMiunes);
        make.centerY.equalTo(backImageView);
        make.size.mas_equalTo(CGSizeMake(35*kMainScaleMiunes, 24*kMainScaleMiunes));
    }];
}


#pragma mark -- Pravite Method

- (void)backButtonAction:(UIButton *)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
