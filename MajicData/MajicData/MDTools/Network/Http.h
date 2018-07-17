//
//  Http.h
//  J-nife
//
//  Created by Tommy on 2017/3/15.
//  Copyright © 2017年 JDL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <AdSupport/AdSupport.h>
#import "VitNetAPIClient.h"

typedef void (^Result)(BOOL success, NSURLSessionDataTask *operation, NSError *error);

@interface Http : NSObject


+ (void)getAsynRequestWithUrl:(NSString *)url
                       params:(NSDictionary *)params
                      success:(void(^)(NSDictionary *resultObject))success
                      failure:(void(^)(NSError  *requestErr))failure;

+ (void)postAsynRequestWithUrl:(NSString *)url
                        params:(NSDictionary *)params
                       success:(void(^)(NSDictionary *resultObject))success
                       failure:(void(^)(NSError  *requestErr))failure;

@end
