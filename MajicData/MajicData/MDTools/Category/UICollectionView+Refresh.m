//
//  UICollectionView+Refresh.m
//  J-nife
//
//  Created by Tommy on 2017/5/3.
//  Copyright © 2017年 JDL. All rights reserved.
//

#import "UICollectionView+Refresh.h"

@implementation UICollectionView (Refresh)
- (void)addPullRefreshHandle:(void(^)(void))block {
    
    MJRefreshNormalHeader *header       = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
    header.lastUpdatedTimeLabel.hidden  = YES;
    header.stateLabel.hidden            = NO;
    header.stateLabel.textColor         = KColor_White;
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
