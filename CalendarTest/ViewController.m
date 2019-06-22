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
    }];
}


@end
