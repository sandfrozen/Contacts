//
//  DefaultImage.m
//  Contacts
//
//  Created by Tomek Buslowski on 31.08.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

#import "DefaultImage.h"


@implementation DefaultImage

+ (UIImage *)generateDefaultImageOfSize:(CGSize)size
{
    CGRect frame = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorRef white = [[UIColor whiteColor] CGColor];
    CGContextSetFillColorWithColor(context, white);
    CGContextFillRect(context, frame);
    
    CGColorRef yellow = [[UIColor yellowColor] CGColor];
    CGContextSetFillColorWithColor(context, yellow);
    CGContextFillRect(context, frame);
    
    CGFloat x = frame.origin.x + size.width / 2;
    CGFloat y = frame.origin.y + size.height / 2;
    CGPoint center = CGPointMake(x, y);
    
    CGColorRef black = [[UIColor blackColor] CGColor];
    CGRect leftEyeRect = CGRectMake(center.x - 225, center.y - 150, 80, 80);
    CGRect rightEyeRect = CGRectMake(center.x + 125, center.y - 150, 80, 80);
    CGContextSetFillColorWithColor(context, black);
    CGContextFillEllipseInRect(context, leftEyeRect);
    CGContextFillEllipseInRect(context, rightEyeRect);
    
    CGContextSetLineWidth(context, 15.0);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, center.x - 200, center.y + 150);
    
    CGContextAddCurveToPoint(context, center.x - 100, center.y + 250, center.x + 100, center.y + 250, center.x + 200, center.y + 150);
    CGContextStrokePath(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
