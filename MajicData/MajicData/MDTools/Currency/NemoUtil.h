//
//  NemoUtil.h
//  TrialEarn
//
//  Created by Tommy on 15/1/11.
//  Copyright (c) 2015年 Nemofish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NemoUtil : NSObject

+ (NSString *)readFromFullPath:(NSString *)fileName;

+ (NSString *)randomString;

+ (BOOL)isEmpty:(NSString *)_str;

+ (NSString *)chineseToUTf8Str:(NSString*)chineseStr;


/**
 通过16进制字符串获取UIColor

 @param hStr 必须为ff3333类型
 @return UIColor
 */
+ (UIColor *)getColorWith16Str:(NSString *)hStr;

/*!
 @method 计算两个字符串的相似度
 */
+ (int)DistanceBetweenTwoString:(NSString*)strA StrAbegin:(int)strAbegin StrAend:(int)strAend StrB:(NSString*)strB StrBbegin:(int)strBbegin StrBend:(int)strBend;

/*!
 @method 随机重新排序NSMutableArray的内容
 */
+ (NSMutableArray *)randomArrayPosition:(NSMutableArray *)_array;


/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/*!
 @method 计算label高度 根据text
 */
+ (CGSize)calculateLabelHeightByText:(UIFont *)_font
                               width:(float)_fWidth
                           heightMax:(float)_fHeightMax
                             content:(NSString *)_strContent;

+ (NSString *)version;

+ (void)printAllFont;

/*!
 @abstract 获取视频的持续时间
 */
+ (CGFloat)getVideoDuration:(NSURL*)_URL;

+ (BOOL)stringContainsEmoji:(NSString *)string;

/*
 *  获取版本号
 *
 */
+ (NSInteger)getAppVersionint;

+ (UIViewController* )rootViewController;
+ (UIViewController* )currentRootController;
+ (UIViewController *)getCurrentVC;
/*
 *  获取几位随机数
 *
 */

+ (NSString *)RandomNumber:(NSInteger)number;
/*
 *  MD5加密
 *
 */

+ (NSString *)getmd5By16:(NSString *)str;

/*
 *  从时间中获取倒计时时间
 */
+ (NSString *)distanceTimeWithBeforeTime:(double)beTime;

/*
 *  输入时间戳,返回时间
 *
 */
+ (NSString *)getTimestrWithTime:(NSInteger)time;
+ (NSString *)getAllTimeWithTime:(NSInteger)time;
+ (NSString *)getTimestrWithFirstTime:(NSInteger)time;
+ (NSString *)getTimestrWithChangeClassTime:(NSInteger)time;

/*
 *  获取当前时间（日期字符串模式）
 *
 */

+ (NSString *)getNowTimeStr;


/*
 *  获取当前时间戳（字符串模式）
 *
 */

+ (NSString *)getNowTimeIntervalStr;

/*
 *  判断日期是否今天
 *
 */

+ (BOOL)isTodayWithStr:(NSString *)dateStr;



+ (void)setExtraCellLineHidden:(UITableView *)tableView;
+ (void)setTableSeparInsert:(UITableView *)tableView edge:(UIEdgeInsets)_edge;

/*
 *  label多字体
 *
 */

+ (NSMutableAttributedString *)loadColorLabel:(NSString *)str changeStr:(NSString *)changeStr color:(UIColor *)color font:(NSInteger)font;
@end
