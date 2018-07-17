//
//  MDYearBarChartView.h
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/28.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MDYearBarChartViewSetting;
@interface MDYearBarChartView : UIView



- (instancetype)initMDYearBarChartViewWithSetting:(MDYearBarChartViewSetting *) setting;


@end


@interface MDYearBarChartViewSetting : NSObject


@property (nonatomic, assign) CGRect        frame;


@property (nonatomic, copy)     NSArray     *dataArray;

@end


