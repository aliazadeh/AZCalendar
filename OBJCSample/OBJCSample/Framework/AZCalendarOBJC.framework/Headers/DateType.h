//
//  DateType.h
//  AZCalendarOBJC
//
//  Created by Ali on 4/14/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DateType;
@interface DateType : NSObject
@property() NSInteger day;
@property() NSInteger month;
@property() NSInteger year;

-(id)initWithDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year;

@end
