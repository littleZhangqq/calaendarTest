//
//  UIView+ATExtension.h
//  WeBuy
//
//  Created by AdminTest on 2017/3/28.
//  Copyright © 2017年 AdminTest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>

@interface UIView (ATExtension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat minX;
@property (nonatomic, assign) CGFloat maxX;
@property (nonatomic, assign) CGFloat minY;
@property (nonatomic, assign) CGFloat maxY;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

//在分类中声明@property 只会生成方法的声明，不会声场方法的实现和带有_下划线的成员变量

//淡入
- (void)fadeInWithTime:(NSTimeInterval)time;

//淡出
- (void)fadeOutWithTime:(NSTimeInterval)time;

//缩放
- (void)scalingWithTime:(NSTimeInterval)time scale:(CGFloat)scale;
//旋转
CGAffineTransform  GetCGAffineTransformRotateAroundPoint(float centerX, float centerY ,float x ,float y ,float angle);

@end
