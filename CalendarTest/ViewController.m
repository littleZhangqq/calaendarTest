//
//  ViewController.m
//  CalendarTest
//
//  Created by zhangqq on 2019/6/21.
//  Copyright © 2019 张强. All rights reserved.
//

#import "ViewController.h"
#import "CalendarView.h"

@interface ViewController ()

ProStrong CalendarView *calendar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ColorRGB(245, 245, 245);
    _calendar = [[CalendarView alloc] init];
    [self.view addSubview:_calendar];
    
    [_calendar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        //这里不用设置高度，选择日期后_calendar的高度会自己变化，注意做好约束就行了。
    }];
}


@end
