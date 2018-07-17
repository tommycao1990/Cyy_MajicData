//
//  Http.m
//  J-nife
//
//  Created by Tommy on 2017/3/15.
//  Copyright © 2017年 JDL. All rights reserved.
//

#import "Http.h"
//#import "VitUser.h"

@implementation Http
+ (void)getAsynRequestWithUrl:(NSString *)url
                       params:(NSDictionary *)params
                      success:(void(^)(NSDictionary *resultObject))success
                      failure:(void(^)(NSError  *requestErr))failure
{
    [Http requestAsynRequestWithUrl:url params:params isGet:YES success:success failure:failure];
}

+ (void)postAsynRequestWithUrl:(NSString *)url
                        params:(NSDictionary *)params
                       success:(void(^)(NSDictionary *resultObject))success
                       failure:(void(^)(NSError  *requestErr))failure
{
    [Http requestAsynRequestWithUrl:url params:params isGet:NO success:success failure:failure];
}

+ (void)requestAsynRequestWithUrl:(NSString *)url
                           params:(NSDictionary *)params
                            isGet:(BOOL)_isGet
                          success:(void(^)(NSDictionary *resultObject))success
                          failure:(void(^)(NSError  *requestErr))failure
{

    
#if DEBUG
    NSLog(@"url1: %@", url);
    NSLog(@"putAsynRequestWithUrl1:%@", params);
#endif
    NSString *adid                = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    CGRect rect_screen            = [[UIScreen mainScreen]bounds];
    CGSize size_screen            = rect_screen.size;
    CGFloat scale_screen          = [UIScreen mainScreen].scale;
    CGFloat width                 = size_screen.width*scale_screen;
    CGFloat height                = size_screen.height*scale_screen;
    NSString *widthStr            = [NSString stringWithFormat:@"%.f",width];
    NSString *heightStr           = [NSString stringWithFormat:@"%.f",height];
    NSString *screenStr           = [NSString stringWithFormat:@"%@X%@",heightStr,widthStr];
    
    VitNetAPIClient *session = [VitNetAPIClient sharedClient];
    
    //  添加header信息
    
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    [session.requestSerializer setValue:[NSString stringWithFormat:@"%ld",(long)[NemoUtil getAppVersionint]] forHTTPHeaderField:@"App_Version"];
    [session.requestSerializer setValue:@"1" forHTTPHeaderField:@"App_Id"];
    [session.requestSerializer setValue:@"AppStore" forHTTPHeaderField:@"Channel_Name"];
    [session.requestSerializer setValue:screenStr forHTTPHeaderField:@"Resolution"];
    [session.requestSerializer setValue:adid forHTTPHeaderField:@"Idfa"];

//    if ([VitUser isLogined])
//    {
//        [session.requestSerializer setValue:[VitUser sharedInstance].token_secret forHTTPHeaderField:@"token_secret"];
//    }
    

    // 开始请求
    __weak typeof(self) wSelf = self;
    id successBlock           = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        if (!wSelf) {
            return ;
        }
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        NSString *resultString  =[[ NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        NSDictionary *dic = (NSDictionary*)responseObject;
        
#if DEBUG
        
        
        NSLog(@"%@", @"================================================");
        NSLog(@"看那看那%@", task);
        NSLog(@"返回状态吗%d",[dic[@"code"] intValue]);
        NSLog(@"头信息%@ ",session);
        NSLog(@"接口%@ %@",url, dic);
        NSLog(@"%@", @"================================================");
#endif
        
        
        if (success != NULL) {
            success(dic);
        }
    };
    
    id failureBlock  = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
        if (failure != NULL)
            failure(error);
        
    };
    
 
    if(_isGet)
    {
        [session GET:url parameters:params progress:nil success:successBlock failure:failureBlock];
    }
    else
    {
        [session POST:url parameters:params progress:nil success:successBlock failure:failureBlock];
    }
}



NSString* __nullable OHPathForFileInBundle(NSString* fileName, NSBundle* bundle)
{
    return [bundle pathForResource:[fileName stringByDeletingPathExtension]
                            ofType:[fileName pathExtension]];
}

@end
