//
//  AZPersianCalendar.m
//  AZCalendarOBJC
//
//  Created by Ali on 4/14/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

#import "AZPersianCalendar.h"
#import "DateType.h"
@implementation AZPersianCalendar

+ (DateType*) getShamsiDate {
    DateType *result = [[DateType alloc] init];
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    
    
    
    NSDateComponents *gregorianComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[[NSDate alloc] initWithTimeIntervalSinceNow:0]];
    
   
    
    NSDate *date = [gregorianCalendar dateFromComponents:gregorianComponents];
    
    
    NSCalendar *persianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierPersian];
    
    NSDateComponents *persianComponent = [persianCalendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
    
    result.day = persianComponent.day;
    result.month = persianComponent.month;
    result.year = persianComponent.year;
    
    
    
    return  result;
}

+ (NSInteger) getPersianDayNumber{
    return [[AZPersianCalendar getShamsiDate] day];
}
+ (NSInteger) getPersianMonthNumber{
 return [[AZPersianCalendar getShamsiDate] month];
}
+ (NSInteger) getPersianYearNumber{
 return [[AZPersianCalendar getShamsiDate] year];
}

@end
