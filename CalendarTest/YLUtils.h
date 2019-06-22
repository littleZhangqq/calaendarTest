//
//  YLUtils.h
//  yilongyueche
//
//  Created by zhangqq on 2018/4/25.
//  Copyright © 2018年 张凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLUtils : NSObject

+(UILabel *)createLabelWithSuper:(UIView *)view fontSize:(UIFont *)font text:(NSString *)text color:(UIColor *)color size:(void(^)(MASConstraintMaker *make))maker;
+(UIImageView *)createImageWithSuper:(UIView *)view imageName:(NSString *)name mode:(UIViewContentMode)mode size:(void(^)(MASConstraintMaker *make))maker;
+(UIView *)addLineForView:(UIView *)view lineColor:(UIColor *)color andMasonry:(void(^)(MASConstraintMaker *make))maker;
+(UIButton *)createBottomButtonFor:(UIView *)view andTitle:(NSString *)title;


@end
