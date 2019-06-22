//
//  UIView+MaskRounded.m
//  Patients
//
//  Created by fuweihan00 on 2018/8/18.
//  Copyright © 2018年 fuweihan00. All rights reserved.
//

#import "UIView+MaskRounded.h"

@implementation UIView (MaskRounded)
- (void)roundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii{
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = rect;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
