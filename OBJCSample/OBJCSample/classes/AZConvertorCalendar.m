//
//  AZConvertorCalendar.m
//  AZCalendarOBJC
//
//  Created by Ali on 4/14/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

#import "AZConvertorCalendar.h"

@implementation AZConvertorCalendar

+(DateType*)convertDateWithinputType:(CalendarType)inputType inputDate:(DateType*)inputDate outputType:(CalendarType)outputType{

    
    DateType *result = [[DateType alloc] initWithDay:0 month:0 year:0];

    NSCalendarIdentifier input = NSCalendarIdentifierPersian;
    NSCalendarIdentifier output = NSCalendarIdentifierPersian;
    
    
    
    switch (inputType) {
        case persian:
            input = NSCalendarIdentifierPersian;
            break;
        
        case gregorian:
             input = NSCalendarIdentifierGregorian;
            break;
            
        case hijri:
             input = NSCalendarIdentifierIslamicCivil;
            break;
            
        default:
            break;
    }
 
    
    switch (outputType) {
        case persian:
            output = NSCalendarIdentifierPersian;
            break;
            
        case gregorian:
            output = NSCalendarIdentifierGregorian;
            break;
            
        case hijri:
            output = NSCalendarIdentifierIslamicCivil;
            break;
            
        default:
            break;
    }
    
    
    NSCalendar *sourceCal = [[NSCalendar alloc] initWithCalendarIdentifier:input];
    
    NSDateComponents *sourceComponent = [[NSDateComponents alloc] init];
    
    sourceComponent.day = inputDate.day;
    sourceComponent.month = inputDate.month;
    sourceComponent.year = inputDate.year;

    NSDate *sourceDate = [sourceCal dateFromComponents:sourceComponent];
    NSCalendar *destinationCal = [[NSCalendar alloc] initWithCalendarIdentifier:output];
  
    
      NSDateComponents *destinationComponents = [destinationCal components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:sourceDate];
    
    result.day = destinationComponents.day;
    result.month = destinationComponents.month;
    result.year = destinationComponents.year;

    return result;
}

@end
