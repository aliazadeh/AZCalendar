//
//  AZCalendar.h
//  AZCalendarOBJC
//
//  Created by Ali on 4/14/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "DateType.h"
#import "AZConvertorCalendar.h"
@class AZCalendar;
@interface AZCalendar : NSObject

+ (DateType*) getCurrentGregorianDate;
+ (DateType*) getCurrentPersianDate;
+ (DateType*) getCurrentHijriDate;

+(DateType*) convertDateWithInputType:(CalendarType)inputType inputDate:(DateType*)inputDate outputType:(CalendarType)outputType;

+(NSInteger)getDayIndexWithDate : (DateType*)date calendar:(CalendarType)calendar;


+(NSString*)getDayNameWithCalendar : (CalendarType)calendar date:(DateType*)date;


+(NSString*)getMonthNameWithCalendar : (CalendarType)calendar date:(DateType*)date;

/*
 
  public static func getDayName
 
 */

/* 
 
 public static func  convertDate(inputType : CalendarType , inputDate : DateType , outputType : CalendarType)->DateType {
 
 let result = AZConvertorCalendar.convertDate(inputType: inputType, inputDate: inputDate, outputType: outputType)
 return result
 }
 
 
 let miladiDay = AZGregorianCalendar.getGregorianDayNumber()
 let miladiMonth = AZGregorianCalendar.getGregorianMonthNumber()
 let miladiYear = AZGregorianCalendar.getGregorianYearNumber()
 
 return DateType.init(day: miladiDay, month: miladiMonth, year: miladiYear)
 
 */

//    public static func getCurrentGregorianDate() -> DateType

@end
