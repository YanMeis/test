//
//  TimeUtils.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>

static int64_t const ONE_MILLISECOND = 1;
static int64_t const ONE_SECOND = 1;
static int64_t const ONE_MINUTE = 60 * ONE_SECOND;
static int64_t const ONE_HORE = 60 * ONE_MINUTE;
static int64_t const ONE_DAY = 24 * ONE_HORE;

@interface TimeUtils : NSObject

+(NSString*)getTimeStr:(NSTimeInterval)time;
+(NSString*)getCurrentTimeStr;
+(NSString*)getTimeStr:(NSTimeInterval)time format:(NSString*)format;
+(int)get_zero_time:(int)time;
+(NSTimeInterval)get_time_by_str:(NSString*)str format:(NSString*)format;
+(int)get_age_by_time:(NSString*)time format:(NSString*)format;
+(NSString*)getTimeStrByDate:(NSDate*)date format:(NSString*)format;
+(NSTimeInterval)getCurrentTime;
+(int64_t)getCurrentTimeWithUnitSeconds;
+(NSString *)stringFromDateString:(NSString *)dateString format:(NSString*)format;
+(NSString *)compareStartTime:(NSString *)start toEndTime:(NSString *)end withFormat:(NSString *)format;
+(int)get_day_between:(NSDate*)start end:(NSDate*)end;

@end
