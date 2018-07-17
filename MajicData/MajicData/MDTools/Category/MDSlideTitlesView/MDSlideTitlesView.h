//
//  MDSlideTitlesView.h
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/24.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectTitleBlock)(NSInteger selectIndex);

@class MDSlideTitlesViewSetting;
@interface MDSlideTitlesView : UIView


@property (nonatomic, copy) SelectTitleBlock  selectTitleBlock;

/**
 根据标签初始化

 @param setting 标签数组
 */
- (instancetype)initSlideTitlesViewWithSettings:(MDSlideTitlesViewSetting *)setting;


@end


@interface MDSlideTitlesViewSetting : NSObject


@property (nonatomic, strong) NSArray       *titles;

/**
 frame
 */
@property (nonatomic, assign) CGRect        frame;


/**
 当前字体颜色
 */
@property (nonatomic, assign) CGFloat        currentFont;

/**
 是否左侧优先
 */
@property (nonatomic, assign) BOOL          priorityLeftL;

/**
 背景颜色
 */
@property (nonatomic, strong) UIColor       *backgroundColor;

/**
 选中时颜色
 */
@property (nonatomic, strong) UIColor       *selectTitleColor;


/**
 未选中时的颜色
 */
@property (nonatomic, strong) UIColor       *unSelectTitleColor;

/**
 当前选中的下标
 */
@property (nonatomic, assign) NSInteger     currentIndex;

@end



