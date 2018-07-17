//
//  UITableView+PullRefresh.m
//  VitabeeOrganization
//
//  Created by Nemofish on 16/7/29.
//  Copyright © 2016年 Nemofish. All rights reserved.
//

#import "UITableView+PullRefresh.h"

@implementation UITableView (PullRefresh)

- (void)addPullRefreshHandle:(void(^)(void))block {
    
    MJRefreshNormalHeader *header       = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
    header.lastUpdatedTimeLabel.hidden  = YES;
    header.stateLabel.hidden            = YES;
    header.backgroundColor              = [UIColor clearColor];
    self.mj_header                      = header;
}

- (void)addPullNextHandle:(void (^)(void))block
{
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:block];
//    [footer setTitle:@"点击或上拉加载更多" forState:MJRefreshStateIdle];
//    [footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
//    [footer setTitle:@"到底啦^0^" forState:MJRefreshStateNoMoreData];
    [footer setTitle:@"" forState:MJRefreshStateIdle];
    [footer setTitle:@"" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"" forState:MJRefreshStateNoMoreData];
    footer.refreshingTitleHidden    = YES;
    footer.stateLabel.font          = [UIFont systemFontOfSize:17];
    footer.stateLabel.textColor     = [UIColor grayColor];
    self.mj_footer = footer;
}
@end
