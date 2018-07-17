//
//  MDActivityDetailViewController.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/29.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDActivityDetailViewController.h"

//View
#import "MDActivityDetailCell.h"
#import "MDActivityDetailTitleCell.h"

#import "MDActivityDetailHeaderTopView.h"
#import "MDActivityDetailHeaderDownView.h"

//


static CGFloat const  headerTopViewHeight = 160;
static CGFloat const  headerDownViewHeight  = 130;

static CGFloat const  titleCellHeight = 40;
static CGFloat const  detailCellHeight = 110;


static NSString *const MDActivityDetailCellID = @"MDActivityDetailCellID";
static NSString *const MDActivityDetailTitleCellID = @"MDActivityDetailTitleCellID";

@interface MDActivityDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView       *tableView;

@property (nonatomic, strong) MDActivityDetailHeaderTopView     *headerTopView;
@property (nonatomic, strong) MDActivityDetailHeaderDownView        *headerDownView;

@property (nonatomic, strong) NSMutableArray        *titleArray;

@end

@implementation MDActivityDetailViewController

#pragma Lazy Load

- (UITableView *)tableView
{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, kMainWidth, kMainHeight - 20)) style:(UITableViewStylePlain)];
        _tableView.backgroundColor = KColor_Gray;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:(CGRectZero)];
        [_tableView registerClass:[MDActivityDetailCell class] forCellReuseIdentifier:MDActivityDetailCellID];
        [_tableView registerClass:[MDActivityDetailTitleCell class] forCellReuseIdentifier:MDActivityDetailTitleCellID];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(NSMutableArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [NSMutableArray arrayWithObjects:
                       @"报名时间",
                       @"活动名称",
                       @"活动店铺",
                       @"活动平台",
                       @"活动时间", nil];
    }
    return _titleArray;
}


#pragma mark -- Controller Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"活动详情";
    //设置返回按钮
    [self setbackItem];
    
    //设置主视图
    [self.view addSubview:self.tableView];
    
    [self initMDActivityDetailHeaderView];
    
}

#pragma mark -- initView

- (void)initMDActivityDetailHeaderView
{
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, kMainWidth, 308*kMainScaleMiunes);
    headerView.backgroundColor = KColor_Gray;
    
    //TopView
    _headerTopView = [[MDActivityDetailHeaderTopView alloc] init];
    _headerTopView.frame = CGRectMake(0, 10*kMainScaleMiunes, kMainWidth, headerTopViewHeight*kMainScaleMiunes);
    [_headerTopView setMDActivityDetailHeaderTopViewSubviewsWith:@"2233"];
    _headerTopView.backgroundColor = KColor_White;
    [headerView addSubview:_headerTopView];
    
    //DownView
    _headerDownView = [[MDActivityDetailHeaderDownView alloc] init];
    _headerDownView.frame = CGRectMake(0, (20+headerTopViewHeight)*kMainScaleMiunes, kMainWidth, headerDownViewHeight*kMainScaleMiunes);
    [_headerDownView initMDActivityDetailHeaderDownViewWithModel:@"2233"];
    _headerDownView.backgroundColor = KColor_White;
    [headerView addSubview:_headerDownView];
    
    self.tableView.tableHeaderView = headerView;
}

#pragma mark -- TableView delegate and datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? 5 : 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        MDActivityDetailTitleCell *titleCell = [tableView dequeueReusableCellWithIdentifier:MDActivityDetailTitleCellID forIndexPath:indexPath];
        
        titleCell.leftStr = self.titleArray[indexPath.row];
        
        switch (indexPath.row) {
            case 0:
                titleCell.rightStr = @"2017-04-03";
                break;
            case 1:
                titleCell.rightStr = @"佣金两天团";

                break;
            case 2:
                titleCell.rightStr = @"花花公子各位";

                break;
            case 3:
                titleCell.rightStr = @"聚划算";

                break;
            case 4:
                titleCell.rightStr = @"2017/04/03 19:00 - 2017/04/05 00:00";
                break;
                
            default:
                break;
        }
        
        
        return titleCell;
    } else {
        MDActivityDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:MDActivityDetailCellID forIndexPath:indexPath];
        
        return cell;
    }
    

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.section == 0 ? titleCellHeight*kMainScaleMiunes : detailCellHeight*kMainScaleMiunes;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *grayView = [[UIView alloc] init];
    grayView.backgroundColor = KColor_Gray;
    grayView.frame = CGRectMake(0, 0, kMainWidth, 10*kMainScaleMiunes);
    return grayView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10*kMainScaleMiunes;
}



#pragma mark -- Pravite Method









@end
