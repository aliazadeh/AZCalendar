//
//  AZHijriCalendar.h
//  AZCalendarOBJC
//
//  Created by Ali on 4/14/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AZHijriCalendar;
@interface AZHijriCalendar : NSObject

+ (NSInteger) getHijriDayNumber;
+ (NSInteger) getHijriMonthNumber;
+ (NSInteger) getHijriYearNumber;

@end
