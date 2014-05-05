//
//  Util.m
//  Hakenman
//
//  Created by Lee jaeeun on 2014/03/29.
//  Copyright (c) 2014年 kjcode. All rights reserved.
//

#import "Util.h"
#import "const.h"
#import "NSDate+Helper.h"

@implementation Util

+ (NSString *)getDocumentPath {
    
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories lastObject];
    DLog(@"%@", documentDirectory);
    
    return documentDirectory;
}

+ (NSString *)weekdayString:(int)weekday {
    //1 = Sunday, 2 = Monday, etc.

    NSString *weekString = nil;

    switch (weekday) {
        case weekSunday:
            weekString = LOCALIZE(@"Common_weekday_sunday");
            break;
        case weekMonday:
            weekString = LOCALIZE(@"Common_weekday_monday");
            break;
        case weekTueDay:
            weekString = LOCALIZE(@"Common_weekday_tueday");
            break;
        case weekWedDay:
            weekString = LOCALIZE(@"Common_weekday_wedday");
            break;
        case weekThuDay:
            weekString = LOCALIZE(@"Common_weekday_thuday");
            break;
        case weekFriDay:
            weekString = LOCALIZE(@"Common_weekday_friday");
            break;
        case weekSatDay:
            weekString = LOCALIZE(@"Common_weekday_satday");
            break;
        default:
            break;
    }
    
    return weekString;
}

+ (NSString *)worktimeString:(NSDate *)dt {
    
    if (dt == nil) {
        return @"";
    }
    
    return [NSString stringWithFormat:@"%2d:%2d",[dt getHour],[dt getMinuite]];
}

+ (float)getWorkTime:(NSDate *)startTime endTime:(NSDate *)endTime {
    
	NSTimeInterval since = [endTime timeIntervalSinceDate:startTime];
    
    return since/(60.f*60.f);
    
}



@end
