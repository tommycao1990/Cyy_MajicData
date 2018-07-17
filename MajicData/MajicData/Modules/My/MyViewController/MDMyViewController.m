//
//  MDMyViewController.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/22.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDMyViewController.h"

//VC
#import "MDShopDetailViewController.h"


//View
#import "MDMyCell.h"

#import "MDSlideTitlesView.h"
#import "MDYearBarChartView.h"
#import "MDMixDataView.h"

static CGFloat const topHeaderViewHeight            = 156;

static CGFloat const footerViewHeight               = 275 + 151;

static CGFloat const SlideTitleViewHeight           = 35;

static CGFloat const mixDataViewHeight              = 240;

static CGFloat const yearBarChartViewHeight         = 151;

static NSString *const myCellID = @"myCellID";

@interface MDMyViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView      *tableView;

@property (nonatomic, strong) UIImageView       *iconImageView;

@property (nonatomic, strong) UILabel           *nameLabel;

@property (nonatomic, strong) MDMixDataView     *mixDataView;

@property (nonatomic, strong) MDYearBarChartView    *yearBarChartView;

@property (nonatomic, strong) MDSlideTitlesView     *slideTitleView;

@end

@implementation MDMyViewController

#pragma mark -- Lazy load

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, -64, kMainWidth, kMainHeight+15)) style:(UITableViewStylePlain)];
        _tableView.backgroundColor = KColor_Gray;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[MDMyCell class] forCellReuseIdentifier:myCellID];
        _tableView.tableHeaderView = [self getMDMyViewControllerHeaderView];
        
        _tableView.tableFooterView = [self getMDMyViewFooterView];
        
    }
    return _tableView;
}


#pragma mark -- Controller Delegate and datasource

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化试图
    [self.view addSubview:self.tableView];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.tabBarController.tabBar.hidden) {
        self.tabBarController.tabBar.hidden = NO;
    }
    
    //设置透明背景
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:(UIBarMetricsDefault)];
    //设置透明色
    [self.navigationController.navigationBar setBarTintColor:KColor_Clear];
    //设置偏移
    [self.navigationController.navigationBar setTranslucent:YES];
    
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //设置透明背景
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:(UIBarMetricsDefault)];
    //设置透明色
    [self.navigationController.navigationBar setBarTintColor:KColor_Main];
    //设置偏移
    [self.navigationController.navigationBar setTranslucent:NO];
    
}

#pragma mark -- initMDMyViewControllerView


//获取headerView
- (UIView *)getMDMyViewControllerHeaderView
{
    
    UIView *backView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kMainWidth, topHeaderViewHeight*kMainScaleMiunes))];
    backView.backgroundColor = KColor_Main;

    CAGradientLayer *layer = [CAGradientLayer layer];
    
    layer.frame = backView.bounds;
    
    layer.colors = @[(__bridge id)UIColorFromRGB(0X62BEFD).CGColor,
                     
                     (__bridge id)KColor_Main.CGColor
                     ];
    
    layer.locations = @[@(0.2),@(0.9)];
    
    layer.startPoint = CGPointMake(0, 0);
    
    layer.endPoint = CGPointMake(0, 1);
    
    layer.type = kCAGradientLayerAxial;
    
    layer.bounds = CGRectMake(0, 0, kMainWidth, topHeaderViewHeight*kMainScaleMiunes);
    
    [backView.layer addSublayer:layer];
    
    _iconImageView = [[UIImageView alloc] init];
    _iconImageView.backgroundColor = KColor_Gray_66;
    _iconImageView.layer.cornerRadius = 33*kMainScaleMiunes;
    _iconImageView.layer.masksToBounds = YES;
    _iconImageView.layer.borderWidth = 1.1f;
    _iconImageView.layer.borderColor = KColor_White.CGColor;
    [backView addSubview:_iconImageView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView).offset(60*kMainScaleMiunes);
        make.left.equalTo(backView).offset(30*kMainScaleMiunes);
        make.size.mas_equalTo(CGSizeMake(66*kMainScaleMiunes, 66*kMainScaleMiunes));
    }];
    
    _nameLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_Clear Title:@"Rick" Font:20*kMainScaleMiunes TextColor:KColor_White];
    [backView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_iconImageView);
        make.left.equalTo(_iconImageView.mas_right).offset(20*kMainScaleMiunes);
        make.height.equalTo(@(22*kMainScaleMiunes));
    }];
    
    
    return backView;
}

- (UIView *)getMDMyViewFooterView
{
    
    
    UIView *footerBackView = [[UIView alloc] init];
    footerBackView.frame = CGRectMake(0, 0, kMainWidth, footerViewHeight*kMainScaleMiunes);
    footerBackView.backgroundColor = KColor_White;
    
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
    
    return footerBackView;
    
}



#pragma mark -- tableView delegate and datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MDMyCell *cell = [tableView dequeueReusableCellWithIdentifier:myCellID forIndexPath:indexPath];

    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55*kMainScaleMiunes;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *backGroundView = [[UIView alloc] init];
    backGroundView.backgroundColor = KColor_White;
    backGroundView.frame = CGRectMake(0, 0, kMainWidth, 40*kMainScaleMiunes);
    
    UILabel *titleLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_White Title:@"管理中的店铺" Font:14*kMainScaleMiunes TextColor:KColor_Black_Main];
    titleLabel.frame = CGRectMake(15*kMainScaleMiunes, 0, kMainWidth, 40*kMainScaleMiunes);
    [backGroundView addSubview:titleLabel];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = KColor_Gray;
    line.frame = CGRectMake(0, 39*kMainScaleMiunes, kMainWidth, 1.2);
    [backGroundView addSubview:line];
    
    return backGroundView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40*kMainScaleMiunes;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MDShopDetailViewController *shopDetailVC = [[MDShopDetailViewController alloc] init];
    [self.navigationController pushViewController:shopDetailVC animated:YES];
    if (!self.tabBarController.tabBar.hidden) {
        self.tabBarController.tabBar.hidden = YES;
    }
}

#pragma mark

@end
