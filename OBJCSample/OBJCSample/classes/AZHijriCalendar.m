//
//  AZHijriCalendar.m
//  AZCalendarOBJC
//
//  Created by Ali on 4/14/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

#import "AZHijriCalendar.h"
#import "DateType.h"
@implementation AZHijriCalendar


+ (DateType*) getHijriDate {
    DateType *result = [[DateType alloc] init];
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    
     NSDateComponents *gregorianComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[[NSDate alloc] initWithTimeIntervalSinceNow:0]];

    NSDate *date = [gregorianCalendar dateFromComponents:gregorianComponents];

    
    NSCalendar *hijriCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierIslamicCivil];
    
   
    NSDateComponents *hijriComponent = [hijriCalendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];

    result.day = hijriComponent.day;
     result.month = hijriComponent.month;
     result.year = hijriComponent.year;
    
    
    
    return  result;
}


+ (NSInteger) getHijriDayNumber{

    return  [[AZHijriCalendar getHijriDate] day];
}
+ (NSInteger) getHijriMonthNumber{
    
     return  [[AZHijriCalendar getHijriDate] month];
}
+ (NSInteger) getHijriYearNumber{
    return  [[AZHijriCalendar getHijriDate] year];
}


@end
