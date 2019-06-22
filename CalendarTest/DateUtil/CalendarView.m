//
//  CalendarView.m
//  Patients
//
//  Created by zhangqq on 2019/6/21.
//  Copyright © 2019 fuweihan00. All rights reserved.
//

#import "CalendarView.h"
#import "DateUtil.h"

@interface CalendarView()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

ProStrong UIScrollView *bgScrollView;
ProStrong UICollectionView *dateCollectionView;
ProStrong UILabel *yearLabel;
ProStrong UILabel *monthLabel;
ProUnsafe NSInteger currentMonth;
ProUnsafe NSInteger currentYear;
ProUnsafe NSInteger defaultLine;
ProUnsafe NSInteger nextMonthHeadDay;
ProUnsafe NSInteger lastMonthRemainDay;
ProUnsafe NSInteger totalDays;
ProStrong NSMutableArray *dataArray;

@end

@implementation CalendarView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createDefaultData];
        [self createMainView];
    }
    return self;
}

-(void)createDefaultData{
    time_t time1 = time(NULL);
    struct tm *time = localtime(&time1);
    self.currentMonth = time->tm_mon+1;
    self.currentYear = time->tm_year+1900;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *string = [NSString stringWithFormat:@"%ld-%02ld-01",(long)self.currentYear,(long)self.currentMonth];
    NSDate *date = [dateFormatter dateFromString:string];
    self.currentDate = date;
}

-(void)createMainView{
    self.backgroundColor = ColorRGB(245, 245, 245);
    _bgScrollView = self.addScrollView(412)
    .delegate(self)
    .alwaysBounceHorizontal(YES)
    .showsHorizontalScrollIndicator(NO)
    .bounces(YES)
    .pagingEnabled(YES)
    .masonry(^(MASConstraintMaker *make){
        make.left.right.bottom.mas_equalTo(self);
        make.height.mas_equalTo(self.defaultLine*H(54));
    }).view;
    
    UIView *container = _bgScrollView.addView(1421132)
    .masonry(^(MASConstraintMaker *make){
        make.edges.height.mas_equalTo(_bgScrollView);
    }).view;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(screenWidth/7, H(54));
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    _dateCollectionView = container.addCollectionView(41125)
    .delegate(self)
    .dataSource(self)
    .collectionViewLayout(layout)
    .backgroundColor(COLOR(whiteColor))
    .masonry(^(MASConstraintMaker *make){
        make.top.bottom.mas_equalTo(container);
        make.width.mas_equalTo(screenWidth);
        make.left.mas_equalTo(container.mas_left).offset(screenWidth);
    }).view;
    [_dateCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    UIView *leftView = container.addView(5112)
    .masonry(^(MASConstraintMaker *make){
        make.top.bottom.left.mas_equalTo(container);
        make.width.mas_equalTo(screenWidth);
    }).view;
    
    UIView *rightView = container.addView(5113)
    .masonry(^(MASConstraintMaker *make){
        make.top.bottom.mas_equalTo(container);
        make.width.mas_equalTo(screenWidth);
        make.left.mas_equalTo(_dateCollectionView.mas_right);
    }).view;
    
    [container mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(rightView);
    }];
    
    UIView *weekView = self.addView(54909)
    .backgroundColor(COLOR(whiteColor))
    .masonry(^(MASConstraintMaker *make){
        make.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(_bgScrollView.mas_top);
        make.height.mas_equalTo(H(40));
    }).view;
    [YLUtils addLineForView:weekView lineColor:ColorRGB(245, 245, 245) andMasonry:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(weekView);
        make.height.mas_equalTo(1);
    }];
    
    NSArray *weekarr = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    for (NSInteger i = 0; i<7; i++) {
        UILabel *weeklabel = [YLUtils createLabelWithSuper:weekView fontSize:FONTSize(15) text:weekarr[i] color:ColorRGB(51, 51, 51) size:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(weekView);
            make.left.mas_equalTo(weekView.mas_left).offset(screenWidth/7*i);
            make.width.mas_equalTo(screenWidth/7);
        }];
        weeklabel.textAlignment = NSTextAlignmentCenter;
    }
    
    UIView *topView = self.addView(9123)
    .masonry(^(MASConstraintMaker *make){
        make.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(weekView.mas_top);
        make.height.mas_equalTo(H(45));
    }).view;
    
    NSArray *arr = @[[NSString stringWithFormat:@"%ld年",self.currentYear],[NSString stringWithFormat:@"%ld月",self.currentMonth]];
    for (NSInteger i = 0; i<2; i++) {
        UIView *view = topView.addView(5232)
        .masonry(^(MASConstraintMaker *make){
            make.top.bottom.mas_equalTo(topView);
            make.width.mas_equalTo(screenWidth/2);
            make.left.mas_equalTo(topView.mas_left).offset(screenWidth/2*i);
        }).view;
        
        UILabel *textlabell = [YLUtils createLabelWithSuper:view fontSize:FONTSize(15) text:arr[i] color:COLOR(blackColor) size:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(view);
        }];
        if (i == 0) {
            _yearLabel = textlabell;
        }else{
            _monthLabel = textlabell;
        }
        
        for (NSInteger j = 0; j<2; j++) {
            UIButton *btn = view.addButton(131+j)
            .image(LocalImage(j == 0? @"left":@"right"))
            .masonry(^(MASConstraintMaker *make){
                make.centerY.mas_equalTo(view);
                if (j == 0) {
                    make.left.mas_equalTo(view.mas_left).offset(W(15));
                }else{
                    make.right.mas_equalTo(view.mas_right).offset(-W(15));
                }
                make.size.mas_equalTo(CGSizeMake(W(30), W(30)));
            }).view;
            
            [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
                if (i == 0 && j == 0) {
                    self.currentYear -= 1;
                }else if (i == 0 && j == 1){
                    self.currentYear += 1;
                }else if (i == 1 && j == 0){
                    if (self.currentMonth == 1) {
                        self.currentMonth = 12;
                        self.currentYear -= 1;
                    }else{
                        self.currentMonth -= 1;
                    }
                }else{
                    if (self.currentMonth == 12) {
                        self.currentMonth = 1;
                        self.currentYear += 1;
                    }else{
                        self.currentMonth += 1;
                    }
                }
                [self clickYearMonthUpdateDate];
            }];
        }
    }
    [_bgScrollView layoutIfNeeded];
    [_bgScrollView setContentOffset:CGPointMake(screenWidth, 0) animated:YES];
}

- (void)setCurrentDate:(NSDate *)currentDate{
    _currentDate = currentDate;
    self.dataArray = [NSMutableArray array];
    NSInteger firstWeekDay = [DateUtil convertDateToFirstWeekDay:_currentDate];
    self.totalDays = [DateUtil convertDateToTotalDays:_currentDate];
    NSInteger column = 7;
    NSInteger available = 1;    //超过总天数后为下月
    self.nextMonthHeadDay = 1; //下月天数开始计数
    self.lastMonthRemainDay = 0;
    NSDate *lastMonthDate = [DateUtil getDateFrom:_currentDate offsetMonths:-1];    //上月月数
    NSInteger lastMonthTotalDays = [DateUtil convertDateToTotalDays:lastMonthDate];//上月天数计数
    self.defaultLine = (self.totalDays + firstWeekDay + 6)/7;
    for (int i = 0; i < self.defaultLine; i++) {
        for (int j = 0; j < column; j++) {
            if (available > self.totalDays) {
                //月尾 多出来的下个月的头几天
                [self.dataArray addObject:@(self.nextMonthHeadDay)];
                self.nextMonthHeadDay++;
                continue;
            }
            
            if (i == 0 && j < firstWeekDay) {
                //月初 多出来的上个月的剩余补位的几天
                NSInteger lastMonthDay = lastMonthTotalDays - firstWeekDay + j + 1; //j从0开始，所以这里+1
                self.lastMonthRemainDay ++;
                [self.dataArray addObject:@(lastMonthDay)];
            }else {
                //正常月份天数
                [self.dataArray addObject:@(available)];
                available ++;
            }
        }
    }
    
    if (_dateCollectionView) {
        [_dateCollectionView reloadData];
    }
    
    [self.bgScrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.defaultLine*H(54));
    }];
    
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.defaultLine*H(54)+H(85));
    }];
    
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
    }];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = COLOR(whiteColor);
    
    do {
        UIView *view = cell.contentView.subviews.lastObject;
        [view removeFromSuperview];
    } while (cell.contentView.subviews.count);
    
    [YLUtils createLabelWithSuper:cell.contentView fontSize:FONTSize(16) text:[NSString stringWithFormat:@"%@",self.dataArray[indexPath.item]] color:COLOR(blackColor) size:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(cell.contentView);
    }];
    [YLUtils addLineForView:cell.contentView lineColor:ColorRGB(245, 245, 245) andMasonry:^(MASConstraintMaker *make) {
        make.top.bottom.left.mas_equalTo(cell.contentView);
        make.width.mas_equalTo(1);
    }];
    
    [YLUtils addLineForView:cell.contentView lineColor:ColorRGB(245, 245, 245) andMasonry:^(MASConstraintMaker *make) {
        make.right.bottom.left.mas_equalTo(cell.contentView);
        make.height.mas_equalTo(1);
    }];
    if (indexPath.item < self.lastMonthRemainDay || indexPath.item >= self.totalDays+self.lastMonthRemainDay) {
        cell.contentView.backgroundColor = ColorRGB(245, 245, 245);
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item < self.lastMonthRemainDay || indexPath.item >= self.totalDays+self.lastMonthRemainDay) {
        return;
    }
    DLog(@"点击的index ：%ld",(long)indexPath.item);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x > screenWidth) {
        if (self.currentMonth < 12) {
            self.currentMonth += 1;
        }else{
            self.currentMonth = 1;
            self.currentYear += 1;
        }
    }else{
        if (self.currentMonth > 1) {
            self.currentMonth -= 1;
        }else{
            self.currentMonth = 12;
            self.currentYear -= 1;
        }
    }
    [self clickYearMonthUpdateDate];
    if (scrollView.contentOffset.x > screenWidth || scrollView.contentOffset.x < screenWidth) {
        [scrollView setContentOffset:CGPointMake(screenWidth, 0)];
    }
}

-(void)clickYearMonthUpdateDate{
    NSArray *arr = @[[NSString stringWithFormat:@"%ld年",self.currentYear],[NSString stringWithFormat:@"%ld月",self.currentMonth]];
    _yearLabel.text = arr[0];
    _monthLabel.text = arr[1];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *string = [NSString stringWithFormat:@"%ld-%02ld-01",(long)self.currentYear,(long)self.currentMonth];
    NSDate *date = [dateFormatter dateFromString:string];
    self.currentDate = date;
}

@end
