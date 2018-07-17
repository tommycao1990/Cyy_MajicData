//
//  NemoUtil.m
//  TrialEarn
//
//  Created by Tommy on 15/1/11.
//  Copyright (c) 2015年 Nemofish. All rights reserved.
//

#import "NemoUtil.h"
#import <AVFoundation/AVFoundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "NSDate+VTB.h"

@implementation NemoUtil
{
}


+ (NSString *)readFromFullPath:(NSString *)fileName {
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSData *data = [fileMgr contentsAtPath:fileName];
    NSString* content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return content;
}

+ (NSString *)randomString
{
    int value = (arc4random() % 1000000000) + 1;
    return [NSString stringWithFormat:@"%d" , value];
}


+ (BOOL)isEmpty:(NSString *)_str
{
    return (!_str || _str.length <= 0) ? YES : NO;
}



#pragma mark - Nemo Private
//字符编码 转化器
+ (NSString *)chineseToUTf8Str:(NSString*)chineseStr
{
    NSStringEncoding encodingUTF8   = NSUTF8StringEncoding;
    NSData *responseData2           = [chineseStr dataUsingEncoding:encodingUTF8];
    NSString *string                = [[NSString alloc] initWithData:responseData2 encoding:encodingUTF8];
    return string;
}

+ (UIColor *)getColorWith16Str:(NSString *)hStr {
    
    if (hStr.length != 6) {
        return [UIColor whiteColor];
    }
    
    unsigned int red,green,blue;
    
    NSRange range;
    
    range.length = 2;
    
    range.location = 0;
    
    [[NSScanner scannerWithString:[hStr substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    
    [[NSScanner scannerWithString:[hStr substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    
    [[NSScanner scannerWithString:[hStr substringWithRange:range]] scanHexInt:&blue];
    
    return RGBA(red, green, blue, 1.0);
    
}

/*!
 @method 计算两个字符串的相似度
 */
+ (int)MiniNum:(int)x SetY:(int)y SetZ:(int)z
{
    int tempNum;
    tempNum = x;
    if (y<tempNum)
    {
        tempNum = y;
    }
    if (z<tempNum)
    {
        tempNum = z;
    }
    return tempNum;
}
+ (int)DistanceBetweenTwoString:(NSString*)strA StrAbegin:(int)strAbegin StrAend:(int)strAend StrB:(NSString*)strB StrBbegin:(int)strBbegin StrBend:(int)strBend
{
    int x,y,z;
    if (strAbegin > strAend)
    {
        if (strBbegin > strBend)
        {
            return 0;
        }
        else
        {
            return strBend - strBbegin +1;
        }
    }
    if (strBbegin>strBend)
    {
        if (strAbegin>strAend)
        {
            return 0;
        }
        else
        {
            return strAend - strAbegin +1;
        }
    }
    if ([strA characterAtIndex:(NSUInteger)(strAbegin)] == [strB characterAtIndex:(NSUInteger)(strBbegin)])
    {
        return [NemoUtil DistanceBetweenTwoString:strA StrAbegin:strAbegin+1 StrAend:strAend StrB:strB StrBbegin: strBbegin+1 StrBend: strBend];
    }
    else
    {
        x = [NemoUtil DistanceBetweenTwoString:strA StrAbegin:strAbegin+1 StrAend:strAend StrB:strB StrBbegin: strBbegin+1 StrBend: strBend];
        y = [NemoUtil DistanceBetweenTwoString:strA StrAbegin:strAbegin StrAend:strAend StrB:strB StrBbegin: strBbegin+1 StrBend: strBend];
        z = [NemoUtil DistanceBetweenTwoString:strA StrAbegin:strAbegin+1 StrAend:strAend StrB:strB StrBbegin: strBbegin StrBend: strBend];
        return [NemoUtil MiniNum:x SetY:y SetZ:z] +1;
    }
}

/*!
 @method 随机重新排序NSMutableArray的内容
 */
+ (NSMutableArray *)randomArrayPosition:(NSMutableArray *)_array
{
    NSUInteger count = [_array count];
    for (NSUInteger i = 0; i < count; ++i)
    {
        int nElements = count - i;
        int n = (arc4random() % nElements) + i;
        [_array exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
    return _array;
}


/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


+ (CGSize)calculateLabelHeightByText:(UIFont *)_font
                               width:(float)_fWidth
                           heightMax:(float)_fHeightMax
                             content:(NSString *)_strContent
{
    CGSize size             = CGSizeMake(_fWidth,_fHeightMax); //设置一个行高上限
    NSDictionary *attribute = @{NSFontAttributeName: _font};
    CGSize labelsize        = [_strContent boundingRectWithSize:size
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:attribute
                                                        context:nil].size;
    return labelsize;
}

+ (NSString *)version
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}


+ (void)printAllFont
{
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    for (indFamily=0; indFamily<[familyNames count]; ++indFamily)
    {
        NSLog(@"Family name: %@", [familyNames objectAtIndex:indFamily]);
        fontNames = [[NSArray alloc] initWithArray:
                     [UIFont fontNamesForFamilyName:
                      [familyNames objectAtIndex:indFamily]]];
        for (indFont=0; indFont<[fontNames count]; ++indFont)
        {
            NSLog(@"Font name: %@", [fontNames objectAtIndex:indFont]);
        }
    }
}


/*!
 @abstract 获取视频的持续时间
 */
+ (CGFloat)getVideoDuration:(NSURL*)_URL
{
    NSDictionary *opts      = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]
                                                     forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
    AVURLAsset *urlAsset    = [AVURLAsset URLAssetWithURL:_URL options:opts];
    float second = 0;
    second = urlAsset.duration.value/urlAsset.duration.timescale;
    return second;
}

/*
 *  emoji判断
 *
 */

+ (BOOL)stringContainsEmoji:(NSString *)string
{
    // 过滤所有表情。returnValue为NO表示不含有表情，YES表示含有表情
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        const unichar hs = [substring characterAtIndex:0];
        // surrogate pair
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
        } else {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                returnValue = YES;
            }
        }
    }];
    return returnValue;
}

/*
 *  获取版本号
 *
 */

+ (NSInteger)getAppVersionint
{
    NSString *version     = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    NSArray *versionArray = [version componentsSeparatedByString:@"."];
    NSString *allVersion  = [NSString stringWithFormat:@"%@%@%@",[NemoUtil getStrLenth:[versionArray objectAtIndex:0]],[NemoUtil getStrLenth:[versionArray objectAtIndex:1]],[NemoUtil getStrLenth:[versionArray objectAtIndex:2]]];

    NSInteger a           = [allVersion intValue];
    return a;
}

+ (NSString *)getStrLenth:(NSString *)str
{
    NSString *logstr = [NSString new];
    if (str.length == 1) {
        logstr = [NSString stringWithFormat:@"00%@",str];
    }
    if (str.length == 2) {
        logstr = [NSString stringWithFormat:@"0%@",str];
        
    }
    if (str.length == 3) {
        logstr = [NSString stringWithFormat:@"%@",str];
    }
    return logstr;
}

+ (UIViewController* )rootViewController
{
    UIViewController* root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    return root;
}

+ (UIViewController* )currentRootController
{
    UIViewController* root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    while (root.presentedViewController) {
        root = root.presentedViewController;
    }
    return root;
}

+ (UIViewController *)getCurrentVC{
    
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到UIWindowLevelNormal的
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    id  nextResponder = nil;
    UIViewController *appRootVC=window.rootViewController;
    //    如果是present上来的appRootVC.presentedViewController 不为nil
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        //        UINavigationController * nav = tabbar.selectedViewController ; 上下两种写法都行
        result=nav.childViewControllers.lastObject;
        
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }else{
        result = nextResponder;
    }
    
    return result;
}


+ (NSString *)RandomNumber:(NSInteger)number{
    
    NSString *strRandom = @"";
    for(int i=0; i<=number; i++)
    {
        
        strRandom = [strRandom stringByAppendingFormat:@"%i",(arc4random() % 9)];
        
    }
    return strRandom;
    
}

+ (NSString *)getmd5By16:(NSString *)str{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    NSNumber *num = [NSNumber numberWithUnsignedLong:strlen(cStr)];
    CC_MD5( cStr,[num intValue], result );
    NSString *tempStr = [[NSString stringWithFormat:
                          @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                          result[0], result[1], result[2], result[3],
                          result[4], result[5], result[6], result[7],
                          result[8], result[9], result[10], result[11],
                          result[12], result[13], result[14], result[15]
                          ] uppercaseString];
    
    return [tempStr substringWithRange:NSMakeRange(8, 16)];
    
    
}

+ (NSString *)distanceTimeWithBeforeTime:(double)beTime
{
    NSTimeInterval now   = [[NSDate localNowDate]timeIntervalSince1970];
    double distanceTime  = now - beTime;
    NSString * distanceStr;
    
    NSDate * beDate      = [NSDate dateWithTimeIntervalSince1970:beTime];
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"HH:mm"];
    
    [df setDateFormat:@"dd"];
    NSString * nowDay    = [df stringFromDate:[NSDate localNowDate]];
    NSString * lastDay   = [df stringFromDate:beDate];
    
    if (distanceTime < 60) //小于一分钟
    {
        distanceStr = @"刚刚";
    }
    else if (distanceTime < 60*60) //时间小于一个小时
    {
        distanceStr = [NSString stringWithFormat:@"%ld分钟前",(long)distanceTime/60];
    }
    else if(distanceTime < 24*60*60 && [nowDay integerValue] == [lastDay integerValue]) //时间小于一天
    {
        //        distanceStr = [NSString stringWithFormat:@"今天%@",timeStr];
        distanceStr = [NSString stringWithFormat:@"%ld小时前",(long)distanceTime/3600];
    }
    else if(distanceTime < 24*60*60*30)
    {
        distanceStr = [NSString stringWithFormat:@"%ld天前",(long)distanceTime/(3600*24)];
    }
    else if(distanceTime < 24*60*60*365)
    {
        distanceStr = [NSString stringWithFormat:@"%ld个月前",(long)distanceTime/(3600*24*30)];
        //        [df setDateFormat:@"MM-dd HH:mm"];
        //        distanceStr = [df stringFromDate:beDate];
    }
    else
    {
        [df setDateFormat:@"yyyy-MM-dd"];
        distanceStr = [df stringFromDate:beDate];
    }
    return distanceStr;
}

+ (NSString *)getTimestrWithTime:(NSInteger)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"];
//    NSTimeZone* GTMzone        = [NSTimeZone timeZoneForSecondsFromGMT:0];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    [formatter setTimeZone:zone];
    NSDate *confromTimesp      = [NSDate dateWithTimeIntervalSince1970:time];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return [confromTimespStr substringFromIndex:10];
    
}

+ (NSString *)getAllTimeWithTime:(NSInteger)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    //    NSTimeZone* GTMzone        = [NSTimeZone timeZoneForSecondsFromGMT:0];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    [formatter setTimeZone:zone];
    NSDate *confromTimesp      = [NSDate dateWithTimeIntervalSince1970:time];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
    
}


+ (NSString *)getTimestrWithFirstTime:(NSInteger)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
//    NSTimeZone* GTMzone        = [NSTimeZone timeZoneForSecondsFromGMT:0];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    [formatter setTimeZone:zone];
    NSDate *confromTimesp      = [NSDate dateWithTimeIntervalSince1970:time];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return [confromTimespStr substringToIndex:10];
}

+ (NSString *)getTimestrWithChangeClassTime:(NSInteger)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd HH:mm"];
//    NSTimeZone* GTMzone        = [NSTimeZone timeZoneForSecondsFromGMT:0];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    [formatter setTimeZone:zone];
    NSDate *confromTimesp      = [NSDate dateWithTimeIntervalSince1970:time];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

+ (NSString *)getNowTimeStr{
    
    NSDate *now = [NSDate date];//根据当前系统的时区产生当前的时间，绝对时间，所以同为中午12点，不同的时区，这个时间是不同的。
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.timeZone = [NSTimeZone systemTimeZone];//系统所在时区
    df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *systemTimeZoneStr =  [df stringFromDate:now];
    
    return systemTimeZoneStr;
}

+ (NSString *)getNowTimeIntervalStr{
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval a=[date timeIntervalSince1970];
    
    NSString*timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
    
    return timeString;
    
}
+ (BOOL)isTodayWithStr:(NSString *)dateStr{
    
    NSString *year_old = [dateStr substringWithRange:(NSMakeRange(0, 4))];
    NSString *month_old = [dateStr substringWithRange:(NSMakeRange(5, 2))];
    NSString *day_old = [dateStr substringWithRange:NSMakeRange(8, 2)];
    NSLog(@"%@-%@-%@",year_old,month_old,day_old);
    
    NSString *nowTime = [self getNowTimeStr];
    
    NSString *year_now = [nowTime substringWithRange:(NSMakeRange(0, 4))];
    NSString *month_now = [nowTime substringWithRange:(NSMakeRange(5, 2))];
    NSString *day_now = [nowTime substringWithRange:NSMakeRange(8, 2)];
    NSLog(@"%@-%@-%@",year_now,month_now,day_now);
    
    
    return (year_old == year_now) && (month_old == month_now) && (day_old == day_now);
}

+ (void)setExtraCellLineHidden:(UITableView *)tableView
{
    UIView *view         = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

+ (void)setTableSeparInsert:(UITableView *)tableView edge:(UIEdgeInsets)_edge
{
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [tableView setSeparatorInset:_edge];
    }
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [tableView setLayoutMargins:_edge];
    }
}


+ (NSMutableAttributedString *)loadColorLabel:(NSString *)str changeStr:(NSString *)changeStr color:(UIColor *)color font:(NSInteger)font
{
    //    NSString *str = @"¥100";
    //    //拼接需要显示的完整字符串
    //    NSString *changeStr = [NSString stringWithFormat:@"总价:%@元",str];
    //获取需要改变的字符串在完整字符串的范围
    NSRange rang = [changeStr rangeOfString:str];
    NSMutableAttributedString *attributStr = [[NSMutableAttributedString alloc]initWithString:changeStr];
    //设置文字颜色
    [attributStr addAttribute:NSForegroundColorAttributeName value:color range:rang];
    
    //设置文字大小
    [attributStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:rang];
    //赋值
    return attributStr;
}


@end
