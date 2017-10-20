//
//  AZCalendar.m
//  AZCalendarOBJC
//
//  Created by Ali on 4/14/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

#import "AZCalendar.h"
#import "AZGregorianCalendar.h"
#import "AZPersianCalendar.h"
#import "AZHijriCalendar.h"
#import "AZMonthName.h"
@implementation AZCalendar

+ (DateType*) getCurrentGregorianDate{
    
    
    NSInteger miladiDay =  [AZGregorianCalendar getGregorianDayNumber];
    NSInteger miladiMonth =  [AZGregorianCalendar getGregorianMonthNumber];
    NSInteger miladiYear =  [AZGregorianCalendar getGregorianYearNumber];
    
    return [[DateType alloc] initWithDay:miladiDay month:miladiMonth year:miladiYear];
    
}
+ (DateType*) getCurrentPersianDate{
    NSInteger persianDay =  [AZPersianCalendar getPersianDayNumber];
    NSInteger persianMonth =  [AZPersianCalendar getPersianMonthNumber];
    NSInteger persianYear =  [AZPersianCalendar getPersianYearNumber];
    
    return [[DateType alloc] initWithDay:persianDay month:persianMonth year:persianYear];
}
+ (DateType*) getCurrentHijriDate{
    
    NSInteger hijriDay =  [AZHijriCalendar getHijriDayNumber];
    NSInteger hijriMonth =  [AZHijriCalendar getHijriMonthNumber];
    NSInteger hijriYear =  [AZHijriCalendar getHijriYearNumber];
    
    return [[DateType alloc] initWithDay:hijriDay month:hijriMonth year:hijriYear];
}

+(DateType*) convertDateWithInputType:(CalendarType)inputType inputDate:(DateType*)inputDate outputType:(CalendarType)outputType{

    return  [AZConvertorCalendar convertDateWithinputType:inputType inputDate:inputDate outputType:outputType];
}

+(NSInteger)getDayIndexWithDate : (DateType*)date calendar:(CalendarType)calendar{
    NSInteger result = 0;
    
    NSCalendarIdentifier type = NSCalendarIdentifierPersian;
    
    
    switch (calendar) {
        case persian :
            type = NSCalendarIdentifierPersian;
            break;
        case gregorian :
            type = NSCalendarIdentifierGregorian;
            break;
        case hijri :
            type = NSCalendarIdentifierIslamicCivil;
            break;
            
        default:
            break;
    }
    
    
    NSCalendar *myCal = [[NSCalendar alloc] initWithCalendarIdentifier:type];
    
    NSDateComponents *component = [[NSDateComponents alloc] init];
    component.day = date.day;
    component.month = date.month;
    component.year = date.year;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"EEE";
    
    NSDate *myDate = [myCal dateFromComponents:component];
    
    
   

    if ([[formatter stringFromDate:myDate] isEqualToString:@"Sun"]){
        result = 0;
    }
    if ([[formatter stringFromDate:myDate] isEqualToString:@"Mon"]){
        result = 1;
    }
    if ([[formatter stringFromDate:myDate] isEqualToString:@"Tue"]){
        result = 2;
    }
    if ([[formatter stringFromDate:myDate] isEqualToString:@"Wed"]){
        result = 3;
    }
    if ([[formatter stringFromDate:myDate] isEqualToString:@"Thu"]){
        result = 4;
    }
    if ([[formatter stringFromDate:myDate] isEqualToString:@"Fri"]){
        result = 5;
    }
    if ([[formatter stringFromDate:myDate] isEqualToString:@"Sat"]){
        result = 6;
    }
    
    
    
 
    
    
    return  result;
}

+(NSString*)getDayNameWithCalendar : (CalendarType)calendar date:(DateType*)date{
    NSString *result = @"Oops :|";
    NSCalendarIdentifier type = NSCalendarIdentifierPersian;
    switch (calendar) {
        case persian :
            type = NSCalendarIdentifierPersian;
            break;
        case gregorian :
            type = NSCalendarIdentifierGregorian;
            break;
        case hijri :
            type = NSCalendarIdentifierIslamicCivil;
            break;
            
        default:
            break;
    }

    
    NSCalendar *myCal = [[NSCalendar alloc] initWithCalendarIdentifier:type];
    
    NSDateComponents *component = [[NSDateComponents alloc] init];
    component.day = date.day;
    component.month = date.month;
    component.year = date.year;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"EEE";
   
    NSDate *myDate = [myCal dateFromComponents:component];
    
    result = [formatter stringFromDate:myDate];
   
    return result;
}

+(NSString*)getMonthNameWithCalendar : (CalendarType)calendar date:(DateType*)date{
    
    return  [AZMonthName getMonthNameWithCalendar:calendar date:date] ;
}

@end
