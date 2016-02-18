//
//  AZPersianCalendar.h
//  AZPersianCalendar
//
//  Created by Ali on 2/16/16.
//  Copyright © 2016 Ali Azadeh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AZPersianCalendar : NSObject



// Miladi Info :
+(NSInteger)getMiladiDayNumber;
+(NSInteger)getMiladiMonthNumber;
+(NSInteger)getMiladiYearNumber;

// Shamsi Info :
+(NSInteger)getShamsiDayNumber;
+(NSInteger)getShamsiMonthNumber;
+(NSInteger)getShamsiYearNumber;

// Hijri Info :
+(NSInteger)getHijriDayNumber;
+(NSInteger)getHijriYearNumber;
+(NSInteger)getHijriMonthNumber;

// Month With Name Of Month

+(NSString*)getHijriMonthNameWithHijriDate : (NSString*) HijriDate;
+(NSString*)getShamsiMonthNameWithShamsiDate : (NSString*) ShamsiDate;
+(NSString*)getMiladiMonthNameWithMiladiDate : (NSString*) MiladiDate;


// Convertors 
+(NSString*)ConvertHijriDateToMiladiDate : (NSString *) HijriDate;
+(NSString*)ConvertShamsiDateToMiladiDate : (NSString *) ShamsiDate;
+(NSString*)convertMiladiDateToShamsiDate :(NSString*) miladiDate;

+(NSString*)convertMiladiDateToHijriDate : (NSString*) miladiDate;


+(NSInteger)getDayOfWeekIndexWithMideDay : (NSString*) miladiDte;

// Get Number Of Day in Month


+(NSInteger)getNumberOfDayInMiladiMonthWithMiladiYearAndMiladiMonth : (NSInteger) MiladiYear : (NSInteger) MiladiMonth;
+(NSInteger)geTNumberOfDayInShamsiMonthWithShamsiYearAndShamsiMonth : (NSInteger) ShamsiYear : (NSInteger) ShamsiMonth;
+(NSInteger)getNumberOfDayInHijriMonthWithHijriYearAndHijriMonth : (NSInteger) HijriYear : (NSInteger) HijriMonth;


@end
