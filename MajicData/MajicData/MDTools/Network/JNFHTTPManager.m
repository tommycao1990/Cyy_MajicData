//
//  JNFHTTPManager.m
//  J-nife
//
//  Created by Tommy on 2017/4/13.
//  Copyright © 2017年 JDL. All rights reserved.
//

#import "JNFHTTPManager.h"

@implementation JNFHTTPManager
+ (instancetype)manager {
    JNFHTTPManager *mgr = [super manager];
    // 创建NSMutableSet对象
    NSMutableSet *newSet = [NSMutableSet set];
    // 添加我们需要的类型
    newSet.set = mgr.responseSerializer.acceptableContentTypes;
    [newSet addObject:@"text/html"];
    
    // 重写给 acceptableContentTypes赋值
    mgr.responseSerializer.acceptableContentTypes = newSet;
    
    return mgr;
}

@end
