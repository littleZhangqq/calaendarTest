//
//  Constance.h
//  CalendarTest
//
//  Created by zhangqq on 2019/6/21.
//  Copyright © 2019 张强. All rights reserved.
//

#ifndef Constance_h
#define Constance_h


// 调试打印
#if APPTYPE == 2
#define DLog(...)
#else
#define DLog(FORMAT, ...) fprintf(stderr,"%s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#endif

#define LocalImage(a)  [UIImage imageNamed:a]

#define ProStrong @property (nonatomic, strong)
#define ProUnsafe @property (nonatomic, unsafe_unretained)
#define ProWeak @property (nonatomic, weak)
#define ProCopy @property (nonatomic, copy)

#define ProLabel(a) @property (nonatomic, strong) UILabel *a;
#define ProImageView(a) @property (nonatomic, strong) UIImageView *a;
#define ProButton(a) @property (nonatomic, strong) UIButton *a;
#define ProView(a) @property (nonatomic, strong) UIView *a;
#define ProTableView(a) @property (nonatomic, strong) UITableView *a;
#define ProScrollView(a) @property (nonatomic, strong) UIScrollView *a;

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

#define W(x) (screenWidth*(x))/375.0
#define H(y) (screenHeight*(y))/667.0

//字体适配调整
#define FONTSize(i) [UIFont systemFontOfSize:i]
#define FONT_BOLD(a) [UIFont boldSystemFontOfSize:a]

#define COLOR(Costom)         ([UIColor Costom])
#define ColorRGB(R,G,B)     [UIColor colorWithRed:(R)/255.0f green:(G)/255.0f blue:(B)/255.0f alpha:1.0f]
#define ColorRGBA(R,G,B,A)     [UIColor colorWithRed:(R)/255.0f green:(G)/255.0f blue:(B)/255.0f alpha:(A)]

#define EqualString(a,b) [a isEqualToString:b]
#define EqualObj(a,b) [a isEqual:b]
#define EqualNullString(a) (!a || [a isEqualToString:@""])



#endif /* Constance_h */
