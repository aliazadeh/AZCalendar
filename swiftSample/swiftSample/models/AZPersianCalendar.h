//
//  AZPersianCalendar.h
//  AZPersianCalendar
//
//  Created by Ali on 2/16/16.
//  Copyright © 2016 Ali Azadeh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalendarType.h"
@interface AZPersianCalendar : NSObject


typedef enum calendar {
    persian ,
    georgian ,
    hijri ,
}CalendarMode;


// Miladi Info :
+(CalendarType*)getMiladiDate;

// Shamsi Info :
+(CalendarType*)getShamsiDate;


// Hijri Info :
+(CalendarType*)getHijriDate;


// Get Month Name :

+(NSString*)getMonthNameWithCalendarMode : (CalendarMode) mode  ;


// Month With Name Of Month
+(NSString*)getHijriMonthNameWithHijriDate : (CalendarType*) HijriDate;
+(NSString*)getShamsiMonthNameWithShamsiDate : (CalendarType*) ShamsiDate;
+(NSString*)getMiladiMonthNameWithMiladiDate : (CalendarType*) MiladiDate;


// get the Day

+(NSString*)getCurrentDay;

// Convertors 
+(CalendarType*)ConvertHijriDateToMiladiDate : (CalendarType*) HijriDate;
+(CalendarType*)ConvertShamsiDateToMiladiDate : (CalendarType*) ShamsiDate;

+(CalendarType*)convertMiladiDateToShamsiDate :(CalendarType*) miladiDate;
+(CalendarType*)convertMiladiDateToHijriDate : (CalendarType*) miladiDate;

+(CalendarType*)ConvertHijriDateToShamsiDate : (CalendarType*) hijriDate;
+(CalendarType*)ConvertShamsiDateToHijriDate : (CalendarType*) shamsiDate;

// -> ** +(NSInteger)getDayOfWeekIndexWithMideDay : (NSString*) miladiDte;

// Get Number Of Day in Month


+(NSInteger)getNumberOfDayInMiladiMonthWithMiladiYearAndMiladiMonth : (NSInteger) MiladiYear : (NSInteger) MiladiMonth;
+(NSInteger)geTNumberOfDayInShamsiMonthWithShamsiYearAndShamsiMonth : (NSInteger) ShamsiYear : (NSInteger) ShamsiMonth;
+(NSInteger)getNumberOfDayInHijriMonthWithHijriYearAndHijriMonth : (NSInteger) HijriYear : (NSInteger) HijriMonth;


@end
