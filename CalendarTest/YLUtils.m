//
//  YLUtils.m
//  yilongyueche
//
//  Created by zhangqq on 2018/4/25.
//  Copyright © 2018年 张凯. All rights reserved.
//

#import "YLUtils.h"
#import <sys/utsname.h>
#import <sys/sysctl.h>


@implementation YLUtils


+(UIImageView *)createImageWithSuper:(UIView *)view imageName:(NSString *)name mode:(UIViewContentMode)mode size:(void(^)(MASConstraintMaker *make))maker{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = mode;
    imageView.layer.masksToBounds = YES;
    if (name.length > 0) {
        imageView.image = LocalImage(name);
    }
    [view addSubview:imageView];
    [imageView mas_makeConstraints:maker];
    return imageView;
}

+(UILabel *)createLabelWithSuper:(UIView *)view fontSize:(UIFont *)font text:(NSString *)text color:(UIColor *)color size:(void(^)(MASConstraintMaker *make))maker{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = color;
    label.font = font;
    [view addSubview:label];
    [label mas_makeConstraints:maker];
    return label;
}

+(UIView *)addLineForView:(UIView *)view lineColor:(UIColor *)color andMasonry:(void(^)(MASConstraintMaker *make))maker{
    UIView *line = [UIView new];
    line.backgroundColor = color;
    [view addSubview:line];
    [line mas_makeConstraints:maker];
    return line;
}

+(UIButton *)createBottomButtonFor:(UIView *)view andTitle:(NSString *)title{
    UIButton *btn = [UIButton buttonWithType:0];
    btn.backgroundColor = ColorRGB(65, 140, 255);
    [btn setTitle:title forState:0];
    [btn setTitleColor:COLOR(whiteColor) forState:0];
    btn.titleLabel.font = FONTSize(16);
    [view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(view);
        make.height.mas_equalTo(H(50));
    }];
    return btn;
}


@end
