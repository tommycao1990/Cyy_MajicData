//
//  MDShopDetailViewController.m
//  MajicData
//
//  Created by Chen on 2017/11/30.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDShopDetailViewController.h"

//View
#import "MDSlideTitlesView.h"
#import "MDYearBarChartView.h"
#import "MDMixDataView.h"

static CGFloat const headerViewHeight               = 110;

static CGFloat const footerViewHeight               = 275 + 151;

static CGFloat const SlideTitleViewHeight           = 35;

static CGFloat const mixDataViewHeight              = 240;

static CGFloat const yearBarChartViewHeight         = 151;

static CGFloat const padding                        = 10;

@interface MDShopDetailViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView          *scrollView;


@property (nonatomic, strong) MDMixDataView     *mixDataView;

@property (nonatomic, strong) MDYearBarChartView    *yearBarChartView;

@property (nonatomic, strong) MDSlideTitlesView     *slideTitleView;

@end

@implementation MDShopDetailViewController


#pragma mark -- Lazy load

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, 0, kMainWidth, kMainHeight))];
        _scrollView.backgroundColor = KColor_Gray;
        _scrollView.contentSize = CGSizeMake(kMainWidth, padding + headerViewHeight*kMainScaleMiunes + padding + footerViewHeight);
        _scrollView.delegate = self;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

#pragma mark -- Controller
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setbackItem];
    
    [self setTitle:@"店铺详情"];

    [self.view addSubview:self.scrollView];
    
    [self getShopDetailHeaderView];
    
    [self getMDShopViewFooterView];
    
}


#pragma mark -- initView

- (void)getShopDetailHeaderView
{
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:(CGRectMake(0, padding, kMainWidth, headerViewHeight))];
    backgroundView.backgroundColor = KColor_White;
    [self.scrollView addSubview:backgroundView];
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    [iconImageView setImage:[UIImage imageNamed:@"HomeShop"]];
    [backgroundView addSubview:iconImageView];
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(15*kMainScaleMiunes));
        make.centerY.equalTo(backgroundView);
        make.size.mas_equalTo(CGSizeMake(80*kMainScaleMiunes, 80*kMainScaleMiunes));
    }];
    
    UILabel *shopNameLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"花花公子格为" Font:14*kMainScaleMiunes TextColor:KColor_Black_Main];
    [backgroundView addSubview:shopNameLabel];
    [shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconImageView.mas_right).offset(15*kMainScaleMiunes);
        make.top.equalTo(iconImageView).offset(8*kMainScaleMiunes);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
    UILabel *type = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"主营：  " Font:14*kMainScaleMiunes TextColor:KColor_Black_Main];
    [backgroundView addSubview:type];
    [type mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconImageView.mas_right).offset(15*kMainScaleMiunes);
        make.centerY.equalTo(iconImageView);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
    UILabel *typeLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"男装" Font:14*kMainScaleMiunes TextColor:KColor_Black_Main];
    [backgroundView addSubview:typeLabel];
    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(type.mas_right).offset(5*kMainScaleMiunes);
        make.centerY.equalTo(type);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
    UILabel *time = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"合同期限：" Font:14*kMainScaleMiunes TextColor:KColor_Black_Main];
    [backgroundView addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconImageView.mas_right).offset(15*kMainScaleMiunes);
        make.bottom.equalTo(iconImageView.mas_bottom).offset(-8*kMainScaleMiunes);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
    UILabel *dealTimeLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"2016/09 - 2017/09" Font:14*kMainScaleMiunes TextColor:KColor_Black_Main];
    [backgroundView addSubview:dealTimeLabel];
    [dealTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(time.mas_right).offset(5*kMainScaleMiunes);
        make.centerY.equalTo(time);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
    
    UILabel *nameLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_Main Title:@"Rick" Font:14*kMainScaleMiunes TextColor:KColor_White];
    nameLabel.layer.cornerRadius = 15*kMainScaleMiunes;
    nameLabel.layer.masksToBounds = YES;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [backgroundView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(backgroundView.mas_right).offset(-15*kMainScaleMiunes);
        make.top.equalTo(backgroundView).offset(15*kMainScaleMiunes);
        make.size.mas_equalTo(CGSizeMake(60*kMainScaleMiunes, 30*kMainScaleMiunes));
    }];
    
}

- (void)getMDShopViewFooterView
{
    
    
    UIView *footerBackView = [[UIView alloc] init];
    footerBackView.frame = CGRectMake(0, padding + headerViewHeight + padding, kMainWidth, footerViewHeight*kMainScaleMiunes);
    footerBackView.backgroundColor = KColor_White;
    [self.view addSubview:footerBackView];
    
    //MDSlideTitlesView
    NSArray *titleArray = @[@"2016",@"2017"];
    
    MDSlideTitlesViewSetting *setting_slide = [[MDSlideTitlesViewSetting alloc] init];
    setting_slide.titles = [titleArray copy];
    setting_slide.selectTitleColor = KColor_Main;
    setting_slide.unSelectTitleColor = KColor_Gray_99;
    setting_slide.frame = CGRectMake(0, 0, kMainWidth, SlideTitleViewHeight);
    setting_slide.currentIndex = titleArray.count - 1;
    setting_slide.backgroundColor = KColor_White;
    setting_slide.currentFont = 16;
    setting_slide.priorityLeftL = YES;
    
    _slideTitleView = [[MDSlideTitlesView alloc] initSlideTitlesViewWithSettings:setting_slide];
    _slideTitleView.frame = CGRectMake(0, 0, kMainWidth, SlideTitleViewHeight*kMainScaleMiunes);
    [footerBackView addSubview:_slideTitleView];
    
    //MDMixDataView
    MDMixDataViewSetting *setting = [[MDMixDataViewSetting alloc] init];
    
    setting.sale = @"1454543";
    setting.saleColor = KColor_Black;
    
    setting.juHuaSuanOutput = @"1204954";
    setting.juHuaSuanOutputColor = KColor_Main;
    setting.juHuaSuanTimes = @"7";
    setting.juHuaSuanAverage = @"23555";
    
    setting.panicPurchaseOutput = @"245435";
    setting.panicPurchaseOutputColor = KColor_Gray_66;
    setting.panicPurchaseTimes = @"5";
    setting.panicPurchaseAverage = @"25362";
    
    setting.frame = CGRectMake(0, SlideTitleViewHeight*kMainScaleMiunes, kMainWidth, mixDataViewHeight*kMainScaleMiunes);
    
    _mixDataView = [[MDMixDataView alloc] initMDMixDataViewWithSetting:setting];
    _mixDataView.frame = setting.frame;
    _mixDataView.backgroundColor = KColor_White;
    [footerBackView addSubview:_mixDataView];
    
    
    //MDYearChartView
    MDYearBarChartViewSetting *setting_year = [[MDYearBarChartViewSetting alloc] init];
    setting_year.frame = CGRectMake(0, (SlideTitleViewHeight + mixDataViewHeight)*kMainScaleMiunes, kMainWidth, yearBarChartViewHeight*kMainScaleMiunes);
    setting_year.dataArray = @[@"100",@"90",@"80",@"70",@"60",@"50",@"40",@"30",@"20",@"10",@"11",@"50"];
    _yearBarChartView = [[MDYearBarChartView alloc] initMDYearBarChartViewWithSetting:setting_year];
    _yearBarChartView.frame = setting_year.frame;
    _yearBarChartView.backgroundColor = KColor_White;
    [footerBackView addSubview:_yearBarChartView];
    
}



@end
