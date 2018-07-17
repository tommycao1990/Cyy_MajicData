//
//  UILable+Text.m
//  J-nife
//
//  Created by Tesla_Chen on 2017/6/9.
//  Copyright © 2017年 JDL. All rights reserved.
//

#import "UILable+Text.h"

@implementation UILable_Text

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setText:(NSString *)text{
    if (!text) {
        [self setText:@""];
    }
}


@end
