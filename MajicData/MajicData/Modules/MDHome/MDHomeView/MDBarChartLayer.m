//
//  MDBarChartLayer.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/28.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDBarChartLayer.h"


@interface MDBarChartLayer ()

@property (nonatomic, strong) NSTimer           *timer;
@property (nonatomic, assign) CGFloat           add;

@end

@implementation MDBarChartLayer


- (instancetype) init {
    self = [super init];
    if (self) {
        
        [self setMainLayer];
        
    }
    return self;
}


- (void) setMainLayer {
    
    _add =  0.1;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        _timer = [NSTimer scheduledTimerWithTimeInterval:_add target:self selector:@selector(addLineT) userInfo:nil repeats:YES];
    });
    
}

- (void) addLineT {
    
    if (self.strokeStart == 0 && self.strokeEnd < 1) {
        self.strokeEnd += _add;
    }
    
    if (self.strokeStart == 0 && self.strokeEnd >= 1) {
        [_timer invalidate];
        _timer = nil;
    }
    
}


@end
