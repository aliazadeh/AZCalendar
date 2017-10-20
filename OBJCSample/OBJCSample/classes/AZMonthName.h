//
//  AZMonthName.h
//  AZCalendarOBJC
//
//  Created by Ali on 4/14/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AZConvertorCalendar.h"
@class AZMonthName;
@interface AZMonthName : NSObject



+ (NSString*) getMonthNameWithCalendar:(CalendarType)calendar date:(DateType*)date;





@end
