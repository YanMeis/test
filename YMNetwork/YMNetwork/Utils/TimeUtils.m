//
//  TimeUtils.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "TimeUtils.h"
#import "StringUtils.h"

#define AGE_NONE -9999

@implementation TimeUtils

+(NSString*)getTimeStr:(NSTimeInterval)time
{
    return [TimeUtils getTimeStr:time format:@"yyyy-MM-dd HH:mm:ss"];
}

+(NSString*)getCurrentTimeStr
{
    return [TimeUtils getTimeStr:[[NSDate date] timeIntervalSince1970]];
}

+(NSString*)getTimeStrByDate:(NSDate*)date format:(NSString*)format
{
    NSDateFormatter *date_fotmatter = [[NSDateFormatter alloc] init];
    [date_fotmatter setDateFormat:format];
    return [date_fotmatter stringFromDate:date];
}


+(NSString*)getTimeStr:(NSTimeInterval)time format:(NSString*)format
{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    
    NSDateFormatter *date_fotmatter = [[NSDateFormatter alloc] init];
    [date_fotmatter setDateFormat:format];
    //    DDLogError(@"setDateFormat --%@--",[date_fotmatter stringFromDate:date]);
    return [date_fotmatter stringFromDate:date];
}
+(int)get_zero_time:(int)time
{
    const time_t t = time;
    struct tm * p = localtime(&t);
    p->tm_hour = 0;
    p->tm_min = 0;
    p->tm_sec = 0;
    return (int)mktime(p);
}
+(NSTimeInterval)get_time_by_str:(NSString*)str format:(NSString*)format
{
    if([StringUtils isNull:str]){
        return 0;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate *someDay = [formatter dateFromString:str];
    return someDay.timeIntervalSince1970;
}

+(int)get_age_by_time:(NSString*)tim format:(NSString*)format
{
    if(tim == nil)
    {
        return AGE_NONE;
    }
    NSTimeInterval t = [TimeUtils get_time_by_str:tim format:format];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:format];
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    NSDate *currentDate = [dateFormatter dateFromString:currentDateStr];
    
    NSTimeInterval time=[currentDate timeIntervalSinceDate:[NSDate dateWithTimeIntervalSince1970:t]];
    int age = ((int)time)/(3600*24*365);
    
    return age;
}

+(NSTimeInterval)getCurrentTime
{
    return [[NSDate date] timeIntervalSince1970];
}

+(int64_t)getCurrentTimeWithUnitSeconds{
    return [[NSDate date] timeIntervalSince1970];
}

+(NSString *)stringFromDateString:(NSString *)dateString format:(NSString*)format{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:dateString];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
    
}
+(NSString *)compareStartTime:(NSString *)start toEndTime:(NSString *)end withFormat:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *startDate = [dateFormatter dateFromString:start];
    NSDate *endDate = [dateFormatter dateFromString:end];
    NSTimeInterval lastInt = [startDate timeIntervalSinceDate:endDate];
    NSString *last = [@(lastInt) stringValue];
    //    DDLogError(@"%@",last);
    return last;
}

+(int)get_day_between:(NSDate*)start end:(NSDate*)end
{
    NSTimeInterval startTime = [end timeIntervalSinceDate:start];
    return startTime / (24 * 60 * 60);
}

@end
