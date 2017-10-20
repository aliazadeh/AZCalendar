//
//  AZGregorianCalendar.m
//  AZCalendarOBJC
//
//  Created by Ali on 4/14/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

#import "AZGregorianCalendar.h"

@implementation AZGregorianCalendar


+ (NSInteger)getGregorianYearNumber{
    
    NSDateFormatter *yearFormatter;
    yearFormatter = [[NSDateFormatter alloc] init];
    [yearFormatter setDateFormat:@"yyyy"];
    NSString *year = [yearFormatter stringFromDate:[NSDate date]];
    
    return [year integerValue];
    
}
+ (NSInteger)getGregorianMonthNumber{
     NSDateFormatter *monthFormatter;
    monthFormatter = [[NSDateFormatter alloc] init];
    [monthFormatter setDateFormat:@"MM"];
    NSString *month = [monthFormatter stringFromDate:[NSDate date]];
    
    return [month integerValue];
    
}
+ (NSInteger)getGregorianDayNumber{
     NSDateFormatter *dayFormatter;
    dayFormatter = [[NSDateFormatter alloc] init];
    [dayFormatter setDateFormat:@"dd"];
    NSString *day = [dayFormatter stringFromDate:[NSDate date]];
    
    return [day integerValue];
    
}
@end
