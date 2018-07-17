//
//  UITableView+PullRefresh.h
//  VitabeeOrganization
//
//  Created by Nemofish on 16/7/29.
//  Copyright © 2016年 Nemofish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

@interface UITableView (PullRefresh)

- (void)addPullRefreshHandle:(void(^)(void))block;
- (void)addPullNextHandle:(void(^)(void))block;
@end
