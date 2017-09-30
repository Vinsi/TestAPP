//
//  UIColor+UIColor_Tint.m
//  CareemGrocery
//
//  Created by vinsi on 8/3/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImager+Tint.h"
#import <CoreImage/CoreImage.h>
@implementation UIImage (Tint)

- (UIImage *)imageTintedWithColor:(UIColor *)color
{
    UIImage *image;
    if (color) {
        // Construct new image the same size as this one.
        UIGraphicsBeginImageContextWithOptions([self size], NO, 0.0); // 0.0 for scale means "scale for device's main screen".
        CGRect rect = CGRectZero;
        rect.size = [self size];
        
        // tint the image
        [self drawInRect:rect];
        [color set];
        UIRectFillUsingBlendMode(rect, kCGBlendModeScreen);
        
        // restore alpha channel
        [self drawInRect:rect blendMode:kCGBlendModeDestinationIn alpha:1.0f];
        
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return image;
}
@end
