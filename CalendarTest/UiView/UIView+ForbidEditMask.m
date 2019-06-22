//
//  UIView+ForbidEditMask.m
//  Patients
//
//  Created by fuweihan00 on 2018/8/27.
//  Copyright © 2018年 fuweihan00. All rights reserved.
//

#import "UIView+ForbidEditMask.h"
#import <objc/runtime.h>
@implementation UIView (ForbidEditMask)
static NSString *nameKey = @"nameKey"; //name的key
- (void)createForbidEditMask{
    
    [self addSubview:self.forbidView];
    
    self.forbidView.frame = self.bounds;
    
    self.forbidView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (void)removeForbidEditMask{

    [self.forbidView removeFromSuperview];
}
-(void)setForbidView:(UIView *)forbidView{
    objc_setAssociatedObject(self, &nameKey, forbidView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(UIView *)forbidView{
    UIView *view = objc_getAssociatedObject(self, &nameKey);
    if (!view) {
        view = [[UIView alloc] init];
        view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
        objc_setAssociatedObject(self, &nameKey, view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return view;
}

@end
