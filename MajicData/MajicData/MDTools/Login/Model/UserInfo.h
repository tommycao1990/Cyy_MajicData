//
//  UserInfo.h
//  MajicData
//
//  Created by Tommy on 2017/12/18.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "BaseJsonModel.h"
@protocol UserInfoResult <NSObject>
@end

@interface UserInfoResult : BaseJsonModel
@property(nonatomic , strong)NSString<Optional>   *vit_id;
@property(nonatomic , strong)NSString<Optional>   *group_id;
@property(nonatomic , strong)NSString<Optional>   *username;
@property(nonatomic , strong)NSString<Optional>   *token_secret;
@property(nonatomic , strong)NSString<Optional>   *user_icon;

@end

@interface UserInfo : BaseJsonModel

+ (void)postLoginIn:(NSString *)username password:(NSString *)password success:(success)_success failure:(failure)_failure;

@end
