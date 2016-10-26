//
//  CalendarType.m
//  ObjSample
//
//  Created by Ali on 10/23/16.
//  Copyright © 2016 Ali Azadeh. All rights reserved.
//

#import "CalendarType.h"

@implementation CalendarType


-(instancetype)initWithDay : (NSInteger) day AndMonth : (NSInteger) month AndYear : (NSInteger) year {

    
    CalendarType *dateObj = [[CalendarType alloc] init];
    
    dateObj.day = day;
    dateObj.year = year;
    dateObj.month = month;
    
    
    return dateObj;

}

@end
