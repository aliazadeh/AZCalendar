//
//  CalendarType.h
//  ObjSample
//
//  Created by Ali on 10/23/16.
//  Copyright © 2016 Ali Azadeh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalendarType : NSObject

@property NSInteger day ;
@property NSInteger month ;
@property NSInteger year ;

-(instancetype)initWithDay : (NSInteger) day AndMonth : (NSInteger) month AndYear : (NSInteger) year;

@end
