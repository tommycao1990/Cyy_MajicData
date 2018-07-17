//
//  MDActivityViewController.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/22.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDActivityViewController.h"

//View
#import "MDActivityListCell.h"

//Model
#import "MDActivityListModel.h"

//VC
#import "MDActivityDetailViewController.h"


static NSString * const MDActivityListCellID = @"MDActivityListCellID";

@interface MDActivityViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView       *tableView;
@end

@implementation MDActivityViewController



#pragma mark -- Controller Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.tabBarController.tabBar.hidden) {
        self.tabBarController.tabBar.hidden = NO;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

#pragma mark -- initView

#pragma mark -- Lazy Load
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, kMainWidth, kMainHeight-64)) style:(UITableViewStylePlain)];
        _tableView.backgroundColor = KColor_Gray;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:(CGRectZero)];
        [_tableView registerClass:[MDActivityListCell class] forCellReuseIdentifier:MDActivityListCellID];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}

#pragma mark -- TableView Delegate and dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MDActivityListCell *cell = [tableView dequeueReusableCellWithIdentifier:MDActivityListCellID forIndexPath:indexPath];
    
    MDActivityListModel *model = [[MDActivityListModel alloc] init];
    model.ownerName = @"暗香";
    model.time = @"2017-02-15";
    model.title = @"佣金两天团";
    model.shopName = @"乾兴瑞服饰专营店";
    model.shopType = @"保暖套装";
    model.sale = @"13,453.00";
    cell.listModel = model;
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130*kMainScaleMiunes;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MDActivityDetailViewController *activityDetailVC = [[MDActivityDetailViewController alloc] init];
    [self.navigationController pushViewController:activityDetailVC animated:YES];
    if (!self.tabBarController.tabBar.hidden) {
        self.tabBarController.tabBar.hidden = YES;
    }
}


@end
