//
//  UIScrollView+UITouch.h
//  VitabeeOrganization
//
//  Created by Tommy on 16/9/20.
//  Copyright © 2016年 Vitabee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (UITouch)

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

@end
