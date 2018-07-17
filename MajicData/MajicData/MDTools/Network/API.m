//
//  API.m
//  J-nife
//
//  Created by Tommy on 2017/3/15.
//  Copyright © 2017年 JDL. All rights reserved.
//

#import "API.h"

@implementation API

+ (void)postLoginCode:(NSString *)cellphone success:(success)_success failure:(failure)_failure{
    
    
    NSMutableDictionary *param = [NSMutableDictionary new];
    [param setObject:cellphone forKey:@"cellphone"];

    [Http postAsynRequestWithUrl:@"" params:param success:_success failure:_failure];
    
}



@end
