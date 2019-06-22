//
//  UIView+ForbidEditMask.h
//  Patients
//
//  Created by fuweihan00 on 2018/8/27.
//  Copyright © 2018年 fuweihan00. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ForbidEditMask)
@property (nonatomic, strong) UIView *forbidView;
- (void)createForbidEditMask;
- (void)removeForbidEditMask;
@end
