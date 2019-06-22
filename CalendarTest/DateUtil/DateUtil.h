//
//  DateUtil.h
//  CalendarTest
//
//  Created by zhangqq on 2019/6/21.
//  Copyright © 2019 张强. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DateUtil : NSObject

+ (NSInteger)convertDateToDay:(NSDate *)date ;
+(NSInteger)convertDateToMonth:(NSDate *)date ;
+(NSInteger)convertDateToYear:(NSDate *)date;
+(NSInteger)convertDateToWeekDay:(NSDate *)date ;
+(NSInteger)convertDateToFirstWeekDay:(NSDate *)date;
+(NSInteger)convertDateToTotalDays:(NSDate *)date;
+(NSDate *)getDateFrom:(NSDate *)date offsetDays:(NSInteger)offsetDays;
+(NSDate *)getDateFrom:(NSDate *)date offsetMonths:(NSInteger)offsetMonths;
+(NSDate *)getDateFrom:(NSDate *)date offsetYears:(NSInteger)offsetYears;

@end

NS_ASSUME_NONNULL_END
