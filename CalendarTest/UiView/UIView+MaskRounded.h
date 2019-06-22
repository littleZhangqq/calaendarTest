//
//  UIView+MaskRounded.h
//  Patients
//
//  Created by fuweihan00 on 2018/8/18.
//  Copyright © 2018年 fuweihan00. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MaskRounded)
- (void)roundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;
@end
