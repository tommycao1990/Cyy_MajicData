//
//  MDHomeViewController.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/22.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDHomeViewController.h"

//View
#import "MDSlideTitlesView.h"
#import "MDMixDataView.h"
#import "MDYearBarChartView.h"
#import "MDWeekBarChartView.h"

#import "LeftSlideView.h"

#import "MDHomeRankCell.h"

//VC
#import "MDDailyDataViewController.h"


static CGFloat const LEFT_SIDEVIEWWIDTH     = 140;
static CGFloat const SlideTitleViewHeight   = 35;
static CGFloat const SegmentViewHeight      = 35;


static NSString * const  MDHOMERANKCELLID   = @"MDHOMERANKCELLID";


typedef enum MDHomeDataType{
    MDHomeDataTypeWeek = 0,   //周
    MDHomeDataTypeMonth,      //月
    MDHomeDataTypeYear,       //年
}MDHomeDataType;


@interface MDHomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) LeftSlideView     *left_sideView;
@property (nonatomic, strong) UIView *backgroundMaskView;
@property (nonatomic, strong) UITableView       *tableView;

@property (nonatomic, strong) UISegmentedControl    *homeSegment;
@property (nonatomic, strong) MDSlideTitlesView     *slideTitleView;
@property (nonatomic, strong) MDMixDataView         *mixDataView;
@property (nonatomic, strong) MDYearBarChartView    *yearBarChartView;
@property (nonatomic, strong) MDWeekBarChartView    *weekBarChartView;

@property (nonatomic, assign) MDHomeDataType        homeDataType;


@end

@implementation MDHomeViewController

#pragma mark  -- Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"数据汇总";
    
    //
    [self setNavigationItems];
    
    //设置segmentControl
    [self setHomeSegmentView];
    
    //设置ScrollTitleView
    NSArray *month = @[@"1月",@"2月",@"3月",@"4月",@"5月",@"6月",@"7月",@"8月"];
    [self setScrollTitleViewWith:month AndIsLeft:YES];
    _homeDataType = MDHomeDataTypeMonth;
    
    
    [self initHomeTableView];
    
    
    [MDUserTool isLoginAndGotoLogin];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.tabBarController.tabBar.hidden) {
        self.tabBarController.tabBar.hidden = NO;
    }
    
}

#pragma mark -- initView

- (void)setNavigationItems
{
    
    UIButton *left_select_button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [left_select_button setImage:[UIImage imageNamed:@"sidebar"] forState:(UIControlStateNormal)];
    left_select_button.frame = CGRectMake(0, 0, 20*kMainScaleMiunes, 20*kMainScaleMiunes);
    [left_select_button addTarget:self action:@selector(selectGroupButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:left_select_button];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    UIButton *right_select_button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [right_select_button setImage:[UIImage imageNamed:@"calender"] forState:(UIControlStateNormal)];
    right_select_button.frame = CGRectMake(0, 0, 20*kMainScaleMiunes, 20*kMainScaleMiunes);
    [right_select_button addTarget:self action:@selector(selectCalenderButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:right_select_button];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
}


//设置分项栏
- (void) setHomeSegmentView {
    
    UIView *segmentBackgroundView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kMainWidth, SegmentViewHeight*kMainScaleMiunes))];
    segmentBackgroundView.backgroundColor = KColor_Main;
    [self.view addSubview:segmentBackgroundView];
    
    _homeSegment = [[UISegmentedControl alloc] initWithItems:@[@"周",@"月",@"年"]];
    _homeSegment.backgroundColor = KColor_Main;
    _homeSegment.frame = CGRectMake(15*kMainScaleMiunes, 2*kMainScaleMiunes, kMainWidth - 30*kMainScaleMiunes, 26*kMainScaleMiunes);
    [segmentBackgroundView addSubview:_homeSegment];
    
    _homeSegment.selectedSegmentIndex = 1;
    _homeSegment.tintColor = KColor_White;
    [_homeSegment addTarget:self
                     action:@selector(homeSegmentViewSelectAction:) forControlEvents:(UIControlEventValueChanged)];
    
}



//设置滑动标题
- (void) setScrollTitleViewWith:(NSArray *)titleArray AndIsLeft:(BOOL) isLeft{
    
    
    if (_slideTitleView) {
        [_slideTitleView removeFromSuperview];
        _slideTitleView = nil;
    }
    
    MDSlideTitlesViewSetting *setting = [[MDSlideTitlesViewSetting alloc] init];
    setting.titles = [titleArray copy];
    setting.selectTitleColor = KColor_Main;
    setting.unSelectTitleColor = KColor_Gray_99;
    setting.frame = CGRectMake(0, SegmentViewHeight, kMainWidth, SlideTitleViewHeight);
    setting.currentIndex = titleArray.count - 1;
    setting.backgroundColor = KColor_White;
    setting.currentFont = 16;
    setting.priorityLeftL = isLeft;
    
    _slideTitleView = [[MDSlideTitlesView alloc] initSlideTitlesViewWithSettings:setting];
    _slideTitleView.frame = CGRectMake(0, SlideTitleViewHeight, kMainWidth, SlideTitleViewHeight);
    [self.view addSubview:_slideTitleView];
    
    
}

//设置图标
- (UIView *)getMixDataView {
    
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
    
    setting.frame = CGRectMake(0, 0, kMainWidth, 240*kMainScaleMiunes);
    
    UIView *backGroundView = [[UIView alloc] init];
    backGroundView.backgroundColor = KColor_White;

    
    switch (_homeDataType) {
        case MDHomeDataTypeWeek:
        {
            backGroundView.frame = CGRectMake(0, 0, kMainWidth, 240*kMainScaleMiunes + 150*kMainScaleMiunes);

            MDWeekBarChartViewSetting *setting_week = [[MDWeekBarChartViewSetting alloc] init];
            setting_week.frame = CGRectMake(0, 240*kMainScaleMiunes, kMainWidth, 150*kMainScaleMiunes);
            setting_week.dataArray = @[@[@"100",@"50"],@[@"70",@"40"],@[@"80",@"20"],@[@"65",@"23"],@[@"44",@"10"],@[@"88",@"55"],@[@"88",@"55"]];
            _weekBarChartView = [[MDWeekBarChartView alloc] initMDWeekBarChartViewWithSetting:setting_week];
            _weekBarChartView.frame = setting_week.frame;
            _weekBarChartView.backgroundColor = KColor_White;
            [backGroundView addSubview:_weekBarChartView];
        }
            break;
        case MDHomeDataTypeMonth:
        {
            backGroundView.frame = CGRectMake(0, 0, kMainWidth, 240*kMainScaleMiunes);
        }
            break;
        case MDHomeDataTypeYear:
        {
            backGroundView.frame = CGRectMake(0, 0, kMainWidth, 240*kMainScaleMiunes + 150*kMainScaleMiunes);
            
            MDYearBarChartViewSetting *setting_year = [[MDYearBarChartViewSetting alloc] init];
            setting_year.frame = CGRectMake(0, 240*kMainScaleMiunes, kMainWidth, 150*kMainScaleMiunes);
            setting_year.dataArray = @[@"100",@"90",@"80",@"70",@"60",@"50",@"40",@"30",@"20",@"10",@"11",@"50"];
            _yearBarChartView = [[MDYearBarChartView alloc] initMDYearBarChartViewWithSetting:setting_year];
            _yearBarChartView.frame = setting_year.frame;
            _yearBarChartView.backgroundColor = KColor_White;
            [backGroundView addSubview:_yearBarChartView];
            
        }
            break;
            
        default:
            break;
    }

    _mixDataView = [[MDMixDataView alloc] initMDMixDataViewWithSetting:setting];
    _mixDataView.frame = setting.frame;
    _mixDataView.backgroundColor = KColor_White;
    [backGroundView addSubview:_mixDataView];
    
    return backGroundView;
    
}


//设置tableview
- (void)initHomeTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, SegmentViewHeight + SlideTitleViewHeight, kMainWidth, kMainHeight - SegmentViewHeight - SlideTitleViewHeight - kTabbarHeight - 64)) style:(UITableViewStylePlain)];
    _tableView.backgroundColor = KColor_White;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[MDHomeRankCell class] forCellReuseIdentifier:MDHOMERANKCELLID];
    
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:(CGRectZero)];
    _tableView.tableHeaderView = [self getMixDataView];
    
    [self.view addSubview:_tableView];
    
}



#pragma mark -- Pravite Method

//点击左侧导航栏按钮
- (void)selectGroupButtonAction {
    
    _left_sideView = [[LeftSlideView alloc] initWithFrame:(CGRectMake(-LEFT_SIDEVIEWWIDTH*kMainScaleMiunes, 0, LEFT_SIDEVIEWWIDTH*kMainScaleMiunes, kMainHeight))];
    _left_sideView.backgroundColor = UIColorFromRGB(0X333843);
    
    [_left_sideView initlifeSlideViewWithGroups:@[@"Rick",@"Morty",@"Melo"]];
    kSelf;
    _left_sideView.selectIndex = ^(NSInteger index) {
        NSLog(@"%ld",index);
        [wSelf tapClose];
    };
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    [keyWindow addSubview:_left_sideView];
    
    
    _backgroundMaskView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kMainWidth, kMainHeight))];
    _backgroundMaskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2f];
    
    UITapGestureRecognizer *tapClose = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClose)];
    [_backgroundMaskView addGestureRecognizer:tapClose];
    
    
    [UIView animateWithDuration:.5f delay:.1f usingSpringWithDamping:1.f initialSpringVelocity:1.f options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        
        _left_sideView.frame = CGRectMake(0, 0, LEFT_SIDEVIEWWIDTH*kMainScaleMiunes, kMainHeight);
        
        _backgroundMaskView.frame = CGRectMake(LEFT_SIDEVIEWWIDTH*kMainScaleMiunes, 0, kMainWidth - LEFT_SIDEVIEWWIDTH*kMainScaleMiunes, kMainHeight);
        
        
        [keyWindow addSubview:_backgroundMaskView];
        
    } completion:^(BOOL finished) {
        
    
    }];
    
}


// 点击空白隐藏侧边栏
- (void)tapClose {
    
    if (!_backgroundMaskView) {
        return;
    }
    
    
    [UIView animateWithDuration:.5f delay:0 usingSpringWithDamping:.7f initialSpringVelocity:1.f options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        
        _left_sideView.frame = CGRectMake(-LEFT_SIDEVIEWWIDTH*kMainScaleMiunes, 0, LEFT_SIDEVIEWWIDTH*kMainScaleMiunes, kMainHeight);
        
        [self.backgroundMaskView removeFromSuperview];
        self.backgroundMaskView = nil;
        
    } completion:^(BOOL finished) {
        

    }];
    
}

//点击日历
- (void)selectCalenderButtonAction
{
    MDDailyDataViewController *dailyDataVC = [[MDDailyDataViewController alloc] init];
    
    [self.navigationController pushViewController:dailyDataVC animated:YES];
    
    if (!self.tabBarController.tabBar.hidden) {
        self.tabBarController.tabBar.hidden = YES;
    }
}


// 点击segmentView
- (void)homeSegmentViewSelectAction:(UISegmentedControl *)segment {
    
    switch (segment.selectedSegmentIndex) {
        case 0:
        {
            NSLog(@"周数据");
            
            NSArray *week = @[@"11/23-11/15",@"11/23-11/15",
                              @"11/23-11/15",
                              @"11/23-11/15",@"上周",@"本周"];
            
            [self setScrollTitleViewWith:week AndIsLeft:YES];
            _homeDataType = MDHomeDataTypeWeek;
            _tableView.tableHeaderView = [self getMixDataView];
            
        }
            break;
        case 1:
        {
            NSLog(@"月数据");
            NSArray *month = @[@"1月",@"2月",@"3月",@"4月",@"5月",@"6月",@"7月",@"8月"];
            [self setScrollTitleViewWith:month AndIsLeft:YES];
            _homeDataType = MDHomeDataTypeMonth;
            _tableView.tableHeaderView = [self getMixDataView];

            
        }
            break;
        case 2:
        {
            NSLog(@"年数据");
            NSArray *year = @[@"2017"];
            [self setScrollTitleViewWith:year AndIsLeft:YES];
            _homeDataType = MDHomeDataTypeYear;
            _tableView.tableHeaderView = [self getMixDataView];

            
        }
            break;
            
        default:
            break;
    }
    
}


#pragma mark -- TableView Delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MDHomeRankCell *cell = [tableView dequeueReusableCellWithIdentifier:MDHOMERANKCELLID forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 61*kMainScaleMiunes;
}



@end

