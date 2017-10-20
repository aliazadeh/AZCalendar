//
//  AZMonthName.m
//  AZCalendarOBJC
//
//  Created by Ali on 4/14/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

#import "AZMonthName.h"

@implementation AZMonthName

+ (NSString*) getMonthNameWithCalendar:(CalendarType)calendar date:(DateType*)date{

    NSString *result = @"Oops";
    
    switch (calendar) {
        case persian:
            result = [AZMonthName getShamsiMonthNameWithMonthName:date.month];
            break;
        case gregorian:
            result = [AZMonthName getMiladiMonthName:date.month];
            break;
        case hijri:
            result = [AZMonthName getHijriMonthNameWithMonthName:date.month];
            break;
        default:
            break;
    }
    
    return result;
}

+(NSString*)getShamsiMonthNameWithMonthName:(NSInteger)monthNumber{
    NSString *result = @"Oops";
    NSArray *persianMonthArray = [[NSArray alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"PersianMonthList" withExtension:@"plist"]];
    result = (NSString *)[persianMonthArray objectAtIndex:monthNumber-1] ;
    return  result;
}

+(NSString*)getHijriMonthNameWithMonthName:(NSInteger)monthNumber{
    NSString *result = @"Oops";
    
    NSArray *hijriMonthArray = [[NSArray alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"HijriMonthList" withExtension:@"plist"]];
    result = (NSString *)[hijriMonthArray objectAtIndex:monthNumber-1] ;
    return result;
}

+(NSString*)getMiladiMonthName:(NSInteger)monthNumber{
    NSString *result = @"Oops";
    NSArray *gregorianMonthArray = [[NSArray alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"gregorianMonthList" withExtension:@"plist"]];
    result = (NSString *)[gregorianMonthArray objectAtIndex:monthNumber-1] ;
    return result;
    
}


@end
