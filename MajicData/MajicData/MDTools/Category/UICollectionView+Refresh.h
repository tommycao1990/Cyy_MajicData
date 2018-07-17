//
//  UICollectionView+Refresh.h
//  J-nife
//
//  Created by Tommy on 2017/5/3.
//  Copyright © 2017年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (Refresh)
            
- (void)addPullRefreshHandle:(void(^)(void))block;
- (void)addPullNextHandle:(void(^)(void))block;

@end
