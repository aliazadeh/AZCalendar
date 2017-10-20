//
//  AZCalendar.h
//  AZCalendarOBJC
//
//  Created by Ali on 4/14/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

#import <Foundation/Foundation.h>

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


@end
