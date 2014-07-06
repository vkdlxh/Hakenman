//
//  NSDate+Helper.m
//  Hakenman
//
//  Created by Lee jaeeun on 2014/05/05.
//  Copyright (c) 2014年 kjcode. All rights reserved.
//

#import "NSDate+Helper.h"

@implementation NSDate (Helper)

- (int)getYear {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSYearCalendarUnit fromDate:self];
    return (int)[components year];
}

- (int)getMonth {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSMonthCalendarUnit fromDate:self];
    return (int)[components month];
}

- (int)getDay {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSDayCalendarUnit fromDate:self];
    return (int)[components day];
}

- (int)getWeekday {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSWeekdayCalendarUnit fromDate:self];
    return (int)[components weekday];
}

- (int)getLastday {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange range = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
    return (int)range.length;
}

- (int)getHour {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSHourCalendarUnit fromDate:self];
    return (int)[components hour];
}

- (int)getMinuite {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSMinuteCalendarUnit fromDate:self];
    return (int)[components minute];
}

- (NSDate *)getBeginOfMonth {
    
    NSDateComponents *comps;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    comps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit fromDate:self];
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    
    NSDateComponents *ret_comps = [[NSDateComponents alloc] init];
    
    [ret_comps setYear:year];
    [ret_comps setMonth:month];
    [ret_comps setDay:1];
    [ret_comps setHour:0];
    [ret_comps setMinute:0];
    [ret_comps setSecond:0];
    
    return [calendar dateFromComponents:ret_comps];
    
}

- (NSDate *)getEndOfMonth {
    
    NSDateComponents *comps;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    comps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit fromDate:self];
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    
    NSDateComponents *ret_comps = [[NSDateComponents alloc] init];
    
    [ret_comps setYear:year];
    [ret_comps setMonth:month];
    [ret_comps setDay:[self getLastday]];
    [ret_comps setHour:23];
    [ret_comps setMinute:59];
    [ret_comps setSecond:59];
    
    return [calendar dateFromComponents:ret_comps];
}

- (NSDate *)getDayOfMonth:(NSInteger)day {
    
    NSDateComponents *comps;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    comps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit fromDate:self];
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    
    NSDateComponents *ret_comps = [[NSDateComponents alloc] init];
    
    [ret_comps setYear:year];
    [ret_comps setMonth:month];
    [ret_comps setDay:day];
    [ret_comps setHour:00];
    [ret_comps setMinute:00];
    [ret_comps setSecond:00];
    
    return [calendar dateFromComponents:ret_comps];
}

- (NSDate *)getTimeOfMonth:(NSInteger)hour mimute:(NSInteger)min {
    
    NSDateComponents *comps;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    comps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:self];
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    
    NSDateComponents *ret_comps = [[NSDateComponents alloc] init];
    
    [ret_comps setYear:year];
    [ret_comps setMonth:month];
    [ret_comps setDay:day];
    [ret_comps setHour:hour];
    [ret_comps setMinute:min];
    [ret_comps setSecond:00];
    
    return [calendar dateFromComponents:ret_comps];
}

+ (NSDate *)convDate2ShortString:(NSString *)yyyyMMdd {
    
    NSString *str = [NSString stringWithFormat:@"%@",yyyyMMdd];
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [formatter setDateFormat:@"yyyyMMdd"];
    DLog(@"%@",str);
    
    return [formatter dateFromString:str];
}

+ (NSDate *)convDate2String:(NSString *)yyyyMMddHHmmss {
    
    NSString *str = [NSString stringWithFormat:@"%@",yyyyMMddHHmmss];
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    DLog(@"%@",str);
    
    return [formatter dateFromString:str];
}

- (NSString *)yyyyMMString {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [formatter setDateFormat:@"yyyyMM"];
    return [formatter stringFromDate:self];
}

- (NSString *)yyyyMMddString {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [formatter setDateFormat:@"yyyyMMdd"];
    return [formatter stringFromDate:self];
}

- (NSString *)yyyyMMddHHmmssString {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    return [formatter stringFromDate:self];
}

- (NSString *)convHHmmString {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [formatter setDateFormat:@"HH:mm"];
    return [formatter stringFromDate:self];
}

@end
