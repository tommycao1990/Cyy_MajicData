//
//  UIImage+resize.h
//  Vitabee
//
//  Created by jacky on 12/25/14.
//  Copyright (c) 2015 cn.vitabee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(resize)

- (UIImage *)croppedImage:(CGRect)bounds;
- (UIImage *)resizedImage:(CGSize)newSize
     interpolationQuality:(CGInterpolationQuality)quality;
- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode
                                  bounds:(CGSize)bounds
                    interpolationQuality:(CGInterpolationQuality)quality;

@end
