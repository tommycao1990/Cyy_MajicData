//
//  MDMixDataView.h
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/27.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MDMixDataViewSetting;
@interface MDMixDataView : UIView




- (instancetype _Nullable ) initMDMixDataViewWithSetting:(MDMixDataViewSetting *_Nullable)setting;


@end


@interface MDMixDataViewSetting : NSObject


@property (nonatomic, assign) CGRect      frame;


/**
 销售额
 */
@property (nonatomic, strong, nullable) NSString    *sale;


/**
 销售额颜色
 */
@property (nonatomic, strong, nullable) UIColor     *saleColor;


/**
 聚划算产出
 */
@property (nonatomic, strong, nullable) NSString    *juHuaSuanOutput;



/**
 聚划算颜色
 */
@property (nonatomic, strong, nullable) UIColor     *juHuaSuanOutputColor;



/**
 聚划算场次
 */
@property (nonatomic, strong, nullable) NSString    *juHuaSuanTimes;


/**
 聚划算均产
 */
@property (nonatomic, strong, nullable) NSString    *juHuaSuanAverage;



/**
 抢购产出
 */
@property (nonatomic, strong, nullable) NSString    *panicPurchaseOutput;


/**
 抢购产出颜色
 */
@property (nonatomic, strong, nullable) UIColor    *panicPurchaseOutputColor;

/**
 抢购场次
 */
@property (nonatomic, strong, nullable) NSString    *panicPurchaseTimes;


/**
 抢购均产
 */
@property (nonatomic, strong, nullable) NSString    *panicPurchaseAverage;

@end
