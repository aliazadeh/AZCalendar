//
//  AZConvertorCalendar.h
//  AZCalendarOBJC
//
//  Created by Ali on 4/14/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DateType.h"

typedef enum calendar  {
    persian ,
    gregorian ,
    hijri ,
}CalendarType;

@class AZConvertorCalendar;
@interface AZConvertorCalendar : NSObject

+(DateType*)convertDateWithinputType:(CalendarType)inputType inputDate:(DateType*)inputDate outputType:(CalendarType)outputType;



@end
