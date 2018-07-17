//
//  LeftSlideView.h
//  MajicData
//
//  Created by Tesla_Chen on 2017/12/1.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LeftSlideViewSelectBlock)(NSInteger index);

@interface LeftSlideView : UIView

@property (nonatomic, copy) LeftSlideViewSelectBlock    selectIndex;


- (void)initlifeSlideViewWithGroups:(NSArray *)groups;



@end
