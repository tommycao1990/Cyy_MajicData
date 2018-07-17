//
//  BaseJsonModel.m
//  J-nife
//
//  Created by Tommy on 2017/3/15.
//  Copyright © 2017年 JDL. All rights reserved.
//

#import "BaseJsonModel.h"

@implementation BaseJsonModel
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"vit_description": @"description"}];
}

- (NSString *)message
{
    if (![_message isValid])
    {
        
        if ([self.code intValue] == 100000)
        {
            self.message = @"请求成功";
            self.success = [NSNumber numberWithBool:YES];
        }else
        {
            self.success = [NSNumber numberWithBool:NO];
            
            switch ([self.code intValue])
            {
                case 120004:
                {
                    self.message = @"用户验证失败，请重新登录";
//                    [[VitUser sharedInstance] logout];
                    
                    break;
                }
                case 999999:
                {
//                    [[AppDelegate instance] loadUpdateView];
                    break;
                }
                    
                    
                default:
                    self.message = self.vit_description;
                    break;
            }
        }
    }
    
    return _message;
}

- (NSNumber *)success
{
    NSString *message = self.message;
    NSLog(@"网络请求信息 : %@" , message);
    return _success;
}

@end
