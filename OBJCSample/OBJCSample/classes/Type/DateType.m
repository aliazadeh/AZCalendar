//
//  DateType.m
//  AZCalendarOBJC
//
//  Created by Ali on 4/14/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

#import "DateType.h"

@implementation DateType

-(id)initWithDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year{

    self.day = day;
    self.month = month;
    self.year = year;

    return self;
}
@end
