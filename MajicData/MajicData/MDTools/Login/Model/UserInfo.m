//
//  UserInfo.m
//  MajicData
//
//  Created by Tommy on 2017/12/18.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "UserInfo.h"
@implementation UserInfoResult
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"vit_id": @"id"}];
}
@end

@implementation UserInfo
+ (void)postLoginIn:(NSString *)username password:(NSString *)password success:(success)_success failure:(failure)_failure{
    NSMutableDictionary *param = [NSMutableDictionary new];
    [param setObject:username forKey:@"username"];
    [param setObject:password forKey:@"password"];
    [Http postAsynRequestWithUrl:KURLLogin_Login params:param success:_success failure:_failure];
}
@end
