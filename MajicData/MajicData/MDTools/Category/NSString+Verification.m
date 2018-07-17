//
//  NSString+Verification.m
//  TZS
//
//  Created by Sean Yue on 15/1/7.
//  Copyright (c) 2015年 NongFuSpring. All rights reserved.
//

#import "NSString+Verification.h"

@implementation NSString (Verification)

-(BOOL)isEmpty {
    if (self.length == 0 || [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0 ) {
        return YES;
    }
    return NO;
}
@end
