//
//  API.h
//  J-nife
//
//  Created by Tommy on 2017/3/15.
//  Copyright © 2017年 JDL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Http.h"
#import "BaseJsonModel.h"

@interface API : NSObject

+ (void)postLoginCode:(NSString *)cellphone success:(success)_success failure:(failure)_failure;


@end
