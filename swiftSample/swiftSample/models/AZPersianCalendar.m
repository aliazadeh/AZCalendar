//
//  AZPersianCalendar.m
//  AZPersianCalendar
//
//  Created by Ali on 2/16/16.
//  Copyright © 2016 Ali Azadeh. All rights reserved.
//

#import "AZPersianCalendar.h"

@implementation AZPersianCalendar




#pragma mark - miladi Novin 
+(CalendarType*)getMiladiDate {
    
    
    
    NSDateFormatter *dayFormatter;
    NSDateFormatter *mountFormatter;
    NSDateFormatter *yearFormatter;
    NSString *day;
    NSString *mount;
    NSString *year;
    dayFormatter = [[NSDateFormatter alloc] init];
    [dayFormatter setDateFormat:@"dd"];
    mountFormatter=[[NSDateFormatter alloc]init];
    [mountFormatter setDateFormat:@"MM"];
    yearFormatter=[[NSDateFormatter alloc]init];
    [yearFormatter setDateFormat:@"yyyy"];
    day=[dayFormatter stringFromDate:[NSDate date]];
    mount=[mountFormatter stringFromDate:[NSDate date]];
    year=[yearFormatter stringFromDate:[NSDate date]];
    
    CalendarType *resultDate = [[CalendarType alloc]initWithDay:[day integerValue] AndMonth:[mount integerValue] AndYear:[year integerValue]];
    
    return resultDate ;
}



#pragma mark Shamsi Novin 
+(CalendarType*)getShamsiDate {

    CalendarType *resultDate = [[CalendarType alloc]initWithDay:[AZPersianCalendar getShamsiDayNumber] AndMonth:[AZPersianCalendar getShamsiMonthNumber] AndYear:[AZPersianCalendar getShamsiYearNumber]];
    return resultDate ;
    
}

#pragma mark Hijri Novin
+(CalendarType*)getHijriDate {

    CalendarType *resultDate = [[CalendarType alloc]initWithDay:[AZPersianCalendar getHijriDayNumber] AndMonth:[AZPersianCalendar getHijriMonthNumber] AndYear:[AZPersianCalendar getHijriYearNumber]];
    return resultDate ;
}


#pragma mark current Day 

+(NSString*)getCurrentDay{
NSString *result = @" ";
    
    NSInteger day = [AZPersianCalendar getMiladiDate].day ;
      NSInteger month = [AZPersianCalendar getMiladiDate].month ;
      NSInteger year = [AZPersianCalendar getMiladiDate].year ;
    
    
    switch ([AZPersianCalendar getDayOfWeekIndexWithMideDay:[NSString stringWithFormat:@"%ld,%ld,%ld" , (long)day , (long)month , (long)year]]) {
            
            
        case 0:
           result = @"Sunday";
            break;
        
        case 1:
            result = @"Monday";
            break;
        case 2:
             result = @"Tuesday";
            break;
        case 3:
             result = @"Wednesday";
            break;
        case 4:
             result = @"Thursday";
            break;
        case 5:
             result = @"Friday";
            break;
            
        case 6:
             result = @"Saturday";
            break;
            
        
            
        default:
            break;
    }
    
    return  result;
}


#pragma mark getMonthName 

+(NSString*)getMonthNameWithCalendarMode : (CalendarMode) mode {

    NSString *result =  @" ";

    switch (mode) {
        case persian:
            
            result = [AZPersianCalendar getShamsiMonthNameWithShamsiDate:[AZPersianCalendar getShamsiDate]];
            
            break;
       
        case georgian:
            
              result = [AZPersianCalendar getMiladiMonthNameWithMiladiDate:[AZPersianCalendar getMiladiDate]];
            
            break;
            
        case hijri:
            
             result = [AZPersianCalendar getHijriMonthNameWithHijriDate:[AZPersianCalendar getHijriDate]];
            
            break;
            
      
    }
    
    return result;
}


#pragma mark - Miladi Info

+(NSInteger)getMiladiDayNumber{
    
    
    NSInteger result=0;
    
    NSDateFormatter *dayFormatter;
    NSDateFormatter *mountFormatter;
    NSDateFormatter *yearFormatter;
    NSString *day;
    NSString *mount;
    NSString *year;
    dayFormatter = [[NSDateFormatter alloc] init];
    [dayFormatter setDateFormat:@"dd"];
    mountFormatter=[[NSDateFormatter alloc]init];
    [mountFormatter setDateFormat:@"MM"];
    yearFormatter=[[NSDateFormatter alloc]init];
    [yearFormatter setDateFormat:@"yyyy"];
    day=[dayFormatter stringFromDate:[NSDate date]];
    mount=[mountFormatter stringFromDate:[NSDate date]];
    year=[yearFormatter stringFromDate:[NSDate date]];
    
    result=[day integerValue];
    
    return result;
}



+(NSInteger)getMiladiYearNumber{
    NSInteger resutl=0;
    NSDateFormatter *dayFormatter;
    NSDateFormatter *mountFormatter;
    NSDateFormatter *yearFormatter;
    NSString *day;
    NSString *mount;
    NSString *year;
    dayFormatter = [[NSDateFormatter alloc] init];
    [dayFormatter setDateFormat:@"dd"];
    mountFormatter=[[NSDateFormatter alloc]init];
    [mountFormatter setDateFormat:@"MM"];
    yearFormatter=[[NSDateFormatter alloc]init];
    [yearFormatter setDateFormat:@"yyyy"];
    day=[dayFormatter stringFromDate:[NSDate date]];
    mount=[mountFormatter stringFromDate:[NSDate date]];
    year=[yearFormatter stringFromDate:[NSDate date]];
    resutl=[year integerValue];
    
    
    return resutl;
    
}

+(NSInteger)getMiladiMonthNumber{
    NSInteger result=0;
    
    
    NSDateFormatter *dayFormatter;
    NSDateFormatter *mountFormatter;
    NSDateFormatter *yearFormatter;
    NSString *day;
    NSString *mount;
    NSString *year;
    dayFormatter = [[NSDateFormatter alloc] init];
    [dayFormatter setDateFormat:@"dd"];
    mountFormatter=[[NSDateFormatter alloc]init];
    [mountFormatter setDateFormat:@"MM"];
    yearFormatter=[[NSDateFormatter alloc]init];
    [yearFormatter setDateFormat:@"yyyy"];
    day=[dayFormatter stringFromDate:[NSDate date]];
    mount=[mountFormatter stringFromDate:[NSDate date]];
    year=[yearFormatter stringFromDate:[NSDate date]];
    
    result=[mount integerValue];
    
    return result;
}


#pragma mark - Shamsi Info


+(NSInteger)getShamsiMonthNumber{
    
    
    NSInteger result=0;
    
    NSDateFormatter *dayFormatter;
    NSDateFormatter *mountFormatter;
    NSDateFormatter *yearFormatter;
    NSString *day;
    NSString *mount;
    NSString *year;
    dayFormatter = [[NSDateFormatter alloc] init];
    [dayFormatter setDateFormat:@"dd"];
    mountFormatter=[[NSDateFormatter alloc]init];
    [mountFormatter setDateFormat:@"MM"];
    yearFormatter=[[NSDateFormatter alloc]init];
    [yearFormatter setDateFormat:@"yyyy"];
    day=[dayFormatter stringFromDate:[NSDate date]];
    mount=[mountFormatter stringFromDate:[NSDate date]];
    year=[yearFormatter stringFromDate:[NSDate date]];
    
    NSInteger shamsiMount=0;
    NSInteger shamsiDay;
    
    
    
    
    
    if ([mount isEqualToString:@"01"]) {
        
        if ([year integerValue]%4==1) {
            
            if ([day integerValue]<=19) {
                shamsiMount=10;
                shamsiDay=[day integerValue]+11;
            }else{
                shamsiMount=11;
                shamsiDay=[day integerValue]-19;
            }
            
            
        }else{
            
            if ([day integerValue]<=20) {
                shamsiMount=10;
                shamsiDay=[day integerValue]+10;
                
            }else{
                shamsiMount=11;
                shamsiDay=[day integerValue]-20;
            }
            
        }
        
    }
    
    
    
    
    if ([mount isEqualToString:@"02"]) {
        
        if ([year integerValue]%4==1) {
            
            if ([day integerValue]<=18) {
                shamsiMount=11;
                shamsiDay=[day integerValue]+12;
            }else{
                shamsiMount=12;
                shamsiDay=[day integerValue]-18;
            }
            
            
        }else{
            
            if ([day integerValue]<=19) {
                shamsiMount=11;
                shamsiDay=[day integerValue]+11;
            }else{
                shamsiMount=12;
                shamsiDay=[day integerValue]-19;
            }
            
        }
        
    }
    
    
    
    
    if ([mount isEqualToString:@"03"]) {
        
        if ([year integerValue]%4==1) {
            
            if ([day integerValue]<=20) {
                shamsiMount=12;
                shamsiDay=[day integerValue]+10;
            }else{
                shamsiMount=1;
                shamsiDay=[day integerValue]-20;
            }
            
            
        }
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=19) {
                shamsiMount=12;
                shamsiDay=[day integerValue]+10;
            }else{
                shamsiMount=1;
                shamsiDay=[day integerValue]-19;
            }
            
        }
        
        if ([year integerValue]%4==2 || [year integerValue]%4==3) {
            
            if ([day integerValue]<=20) {
                shamsiMount=12;
                shamsiDay=[day integerValue]+9;
            }else{
                shamsiDay=[day integerValue]-20;
                shamsiMount=1;
            }
            
        }
        
        
        
    }
    
    
    
    
    
    if ([mount isEqualToString:@"04"]) {
        
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=19) {
                shamsiMount=1;
                shamsiDay=[day integerValue]+12;
            }else{
                shamsiMount=2;
                shamsiDay=[day integerValue]-19;
            }
            
            
        }else{
            
            if ([day integerValue]<=20) {
                shamsiMount=1;
                shamsiDay=[day integerValue]+11;
            }else{
                shamsiMount=2;
                shamsiDay=[day integerValue]-20;
            }
            
        }
        
    }
    
    
    
    
    
    
    
    if ([mount isEqualToString:@"05"]) {
        
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=20) {
                shamsiMount=2;
                shamsiDay=[day integerValue]+11;
            }else{
                shamsiMount=3;
                shamsiDay=[day integerValue]-20;
            }
            
            
        }else{
            
            if ([day integerValue]<=21) {
                shamsiMount=2;
                shamsiDay=[day integerValue]+10;
            }else{
                shamsiMount=3;
                shamsiDay=[day integerValue]-21;
            }
            
        }
        
    }
    
    
    
    if ([mount isEqualToString:@"06"]) {
        
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=20) {
                shamsiMount=3;
                shamsiDay=[day integerValue]+11;
            }else{
                shamsiMount=4;
                shamsiDay=[day integerValue]-20;
            }
            
            
        }else{
            
            if ([day integerValue]<=21) {
                shamsiMount=3;
                shamsiDay=[day integerValue]+10;
            }else{
                shamsiMount=4;
                shamsiDay=[day integerValue]-21;
            }
            
        }
        
    }
    
    
    if ([mount isEqualToString:@"07"]) {
        
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=21) {
                shamsiMount=4;
                shamsiDay=[day integerValue]+10;
            }else{
                shamsiMount=5;
                shamsiDay=[day integerValue]-21;
            }
            
            
        }else{
            
            if ([day integerValue]<=22) {
                shamsiMount=4;
                shamsiDay=[day integerValue]+9;
            }else{
                shamsiMount=5;
                shamsiDay=[day integerValue]-22;
            }
            
        }
        
    }
    
    
    
    
    
    
    
    
    if ([mount isEqualToString:@"08"]) {
        
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=21) {
                shamsiMount=5;
                shamsiDay=[day integerValue]+10;
            }else{
                shamsiMount=6;
                shamsiDay=[day integerValue]-21;
            }
            
            
        }else{
            
            if ([day integerValue]<=22) {
                shamsiMount=5;
                shamsiDay=[day integerValue]+9;
            }else{
                shamsiMount=6;
                shamsiDay=[day integerValue]-22;
            }
            
        }
        
    }
    
    
    
    
    
    if ([mount isEqualToString:@"09"]) {
        
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=21) {
                shamsiMount=6;
                shamsiDay=[day integerValue]+10;
            }else{
                shamsiMount=7;
                shamsiDay=[day integerValue]-21;
            }
            
            
        }else{
            
            if ([day integerValue]<=22) {
                shamsiMount=6;
                shamsiDay=[day integerValue]+9;
            }else{
                shamsiMount=7;
                shamsiDay=[day integerValue]-22;
            }
            
        }
        
    }
    
    
    
    
    if ([mount isEqualToString:@"10"]) {
        
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=21) {
                shamsiMount=7;
                shamsiDay=[day integerValue]+9;
            }else{
                shamsiMount=8;
                shamsiDay=[day integerValue]-21;
            }
            
            
        }else{
            
            if ([day integerValue]<=22) {
                shamsiMount=7;
                shamsiDay=[day integerValue]+8;
            }else{
                shamsiMount=8;
                shamsiDay=[day integerValue]-22;
            }
            
        }
        
    }
    
    
    
    
    if ([mount isEqualToString:@"11"]) {
        
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=20) {
                shamsiMount=8;
                shamsiDay=[day integerValue]+10;
            }else{
                shamsiMount=9;
                shamsiDay=[day integerValue]-20;
            }
            
            
        }else{
            
            if ([day integerValue]<=21) {
                shamsiMount=8;
                shamsiDay=[day integerValue]+9;
            }else{
                shamsiMount=9;
                shamsiDay=[day integerValue]-21;
            }
            
        }
        
    }
    
    
    
    if ([mount isEqualToString:@"12"]) {
        
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=20) {
                shamsiMount=9;
                shamsiDay=[day integerValue]+10;
            }else{
                shamsiMount=10;
                shamsiDay=[day integerValue]-20;
            }
            
            
        }else{
            
            if ([day integerValue]<=21) {
                shamsiMount=9;
                shamsiDay=[day integerValue]+9;
            }else{
                shamsiMount=10;
                shamsiDay=[day integerValue]-21;
            }
            
        }
        
    }
    
    
    
    result=shamsiMount;
    
    return result;
    
    
    
}


+(NSInteger)getShamsiYearNumber{
    
    
    NSInteger result=0;
    
    NSInteger myMiladiYear=[self getMiladiYearNumber];
    NSInteger myMiladiMonth=[self getMiladiMonthNumber];
    NSInteger myMiladyDay=[self getMiladiDayNumber];
    
    
    
    
    if (myMiladiMonth<=2) {
        result=myMiladiYear-622;
    }
    if (myMiladiMonth==3) {
        
        
        if (myMiladiYear%4==0) {
            
            if (myMiladyDay<=19) {
                result=myMiladiYear-622;
            }else{
                result=myMiladiYear-621;
            }
            
            
            
            if (myMiladiYear%4==1) {
                if (myMiladyDay<=20) {
                    result=myMiladiYear-622;
                }else{
                    result=myMiladiYear-621;
                }
                
            }
            
            if (myMiladiYear%4==2) {
                
                
                if (myMiladyDay<=20) {
                    result=myMiladiYear-622;
                }else{
                    result=myMiladiYear-621;
                }
                
                
            }
            
            
            if (myMiladiYear%4==3) {
                
                if (myMiladyDay<=20) {
                    result=myMiladiYear-622;
                }else{
                    result=myMiladiYear-621;
                }
                
            }
            
            
            
        }
        
        
        
    }
    
    if (myMiladiMonth>=4) {
        result=myMiladiYear-621;
    }
    
    
    
    return result;
}



+(NSInteger)getShamsiDayNumber{
    
    
    
    NSInteger result=0;
    
    NSDateFormatter *dayFormatter;
    NSDateFormatter *mountFormatter;
    NSDateFormatter *yearFormatter;
    NSString *day;
    NSString *mount;
    NSString *year;
    dayFormatter = [[NSDateFormatter alloc] init];
    [dayFormatter setDateFormat:@"dd"];
    mountFormatter=[[NSDateFormatter alloc]init];
    [mountFormatter setDateFormat:@"MM"];
    yearFormatter=[[NSDateFormatter alloc]init];
    [yearFormatter setDateFormat:@"yyyy"];
    day=[dayFormatter stringFromDate:[NSDate date]];
    mount=[mountFormatter stringFromDate:[NSDate date]];
    year=[yearFormatter stringFromDate:[NSDate date]];
    
    NSInteger shamsiMount=0;
    NSInteger shamsiDay=0;
    
    
    
    
    
    if ([mount isEqualToString:@"01"]) {
        
        if ([year integerValue]%4==1) {
            
            if ([day integerValue]<=19) {
                shamsiMount=10;
                shamsiDay=[day integerValue]+11;
            }else{
                shamsiMount=11;
                shamsiDay=[day integerValue]-19;
            }
            
            
        }else{
            
            if ([day integerValue]<=20) {
                shamsiMount=10;
                shamsiDay=[day integerValue]+10;
                
            }else{
                shamsiMount=11;
                shamsiDay=[day integerValue]-20;
            }
            
        }
        
    }
    
    
    
    
    if ([mount isEqualToString:@"02"]) {
        
        if ([year integerValue]%4==1) {
            
            if ([day integerValue]<=18) {
                shamsiMount=11;
                shamsiDay=[day integerValue]+12;
            }else{
                shamsiMount=12;
                shamsiDay=[day integerValue]-18;
            }
            
            
        }else{
            
            if ([day integerValue]<=19) {
                shamsiMount=11;
                shamsiDay=[day integerValue]+11;
            }else{
                shamsiMount=12;
                shamsiDay=[day integerValue]-19;
            }
            
        }
        
    }
    
    
    
    
    if ([mount isEqualToString:@"03"]) {
        
        if ([year integerValue]%4==1) {
            
            if ([day integerValue]<=20) {
                shamsiMount=12;
                shamsiDay=[day integerValue]+10;
            }else{
                shamsiMount=1;
                shamsiDay=[day integerValue]-20;
            }
            
            
        }
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=19) {
                shamsiMount=12;
                shamsiDay=[day integerValue]+10;
            }else{
                shamsiMount=1;
                shamsiDay=[day integerValue]-19;
            }
            
        }
        
        if ([year integerValue]%4==2 || [year integerValue]%4==3) {
            
            if ([day integerValue]<=20) {
                shamsiMount=12;
                shamsiDay=[day integerValue]+9;
            }else{
                shamsiDay=[day integerValue]-20;
                shamsiMount=1;
            }
            
        }
        
        
        
    }
    
    
    
    
    
    if ([mount isEqualToString:@"04"]) {
        
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=19) {
                shamsiMount=1;
                shamsiDay=[day integerValue]+12;
            }else{
                shamsiMount=2;
                shamsiDay=[day integerValue]-19;
            }
            
            
        }else{
            
            if ([day integerValue]<=20) {
                shamsiMount=1;
                shamsiDay=[day integerValue]+11;
            }else{
                shamsiMount=2;
                shamsiDay=[day integerValue]-20;
            }
            
        }
        
    }
    
    
    
    
    
    
    
    if ([mount isEqualToString:@"05"]) {
        
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=20) {
                shamsiMount=2;
                shamsiDay=[day integerValue]+11;
            }else{
                shamsiMount=3;
                shamsiDay=[day integerValue]-20;
            }
            
            
        }else{
            
            if ([day integerValue]<=21) {
                shamsiMount=2;
                shamsiDay=[day integerValue]+10;
            }else{
                shamsiMount=3;
                shamsiDay=[day integerValue]-21;
            }
            
        }
        
    }
    
    
    
    if ([mount isEqualToString:@"06"]) {
        
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=20) {
                shamsiMount=3;
                shamsiDay=[day integerValue]+11;
            }else{
                shamsiMount=4;
                shamsiDay=[day integerValue]-20;
            }
            
            
        }else{
            
            if ([day integerValue]<=21) {
                shamsiMount=3;
                shamsiDay=[day integerValue]+10;
            }else{
                shamsiMount=4;
                shamsiDay=[day integerValue]-21;
            }
            
        }
        
    }
    
    
    if ([mount isEqualToString:@"07"]) {
        
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=21) {
                shamsiMount=4;
                shamsiDay=[day integerValue]+10;
            }else{
                shamsiMount=5;
                shamsiDay=[day integerValue]-21;
            }
            
            
        }else{
            
            if ([day integerValue]<=22) {
                shamsiMount=4;
                shamsiDay=[day integerValue]+9;
            }else{
                shamsiMount=5;
                shamsiDay=[day integerValue]-22;
            }
            
        }
        
    }
    
    
    
    
    
    
    
    
    if ([mount isEqualToString:@"08"]) {
        
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=21) {
                shamsiMount=5;
                shamsiDay=[day integerValue]+10;
            }else{
                shamsiMount=6;
                shamsiDay=[day integerValue]-21;
            }
            
            
        }else{
            
            if ([day integerValue]<=22) {
                shamsiMount=5;
                shamsiDay=[day integerValue]+9;
            }else{
                shamsiMount=6;
                shamsiDay=[day integerValue]-22;
            }
            
        }
        
    }
    
    
    
    
    
    if ([mount isEqualToString:@"09"]) {
        
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=21) {
                shamsiMount=6;
                shamsiDay=[day integerValue]+10;
            }else{
                shamsiMount=7;
                shamsiDay=[day integerValue]-21;
            }
            
            
        }else{
            
            if ([day integerValue]<=22) {
                shamsiMount=6;
                shamsiDay=[day integerValue]+9;
            }else{
                shamsiMount=7;
                shamsiDay=[day integerValue]-22;
            }
            
        }
        
    }
    
    
    
    
    if ([mount isEqualToString:@"10"]) {
        
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=21) {
                shamsiMount=7;
                shamsiDay=[day integerValue]+9;
            }else{
                shamsiMount=8;
                shamsiDay=[day integerValue]-21;
            }
            
            
        }else{
            
            if ([day integerValue]<=22) {
                shamsiMount=7;
                shamsiDay=[day integerValue]+8;
            }else{
                shamsiMount=8;
                shamsiDay=[day integerValue]-22;
            }
            
        }
        
    }
    
    
    
    
    if ([mount isEqualToString:@"11"]) {
        
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=20) {
                shamsiMount=8;
                shamsiDay=[day integerValue]+10;
            }else{
                shamsiMount=9;
                shamsiDay=[day integerValue]-20;
            }
            
            
        }else{
            
            if ([day integerValue]<=21) {
                shamsiMount=8;
                shamsiDay=[day integerValue]+9;
            }else{
                shamsiMount=9;
                shamsiDay=[day integerValue]-21;
            }
            
        }
        
    }
    
    
    
    if ([mount isEqualToString:@"12"]) {
        
        if ([year integerValue]%4==0) {
            
            if ([day integerValue]<=20) {
                shamsiMount=9;
                shamsiDay=[day integerValue]+10;
            }else{
                shamsiMount=10;
                shamsiDay=[day integerValue]-20;
            }
            
            
        }else{
            
            if ([day integerValue]<=21) {
                shamsiMount=9;
                shamsiDay=[day integerValue]+9;
            }else{
                shamsiMount=10;
                shamsiDay=[day integerValue]-21;
            }
            
        }
        
    }
    
    
    
    result=shamsiDay;
    
    
    return result;
}


#pragma mark - Hijri Info


+(NSInteger)getHijriYearNumber{
    
    // Create a Gregorian Calendar
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    // Set up components of a Gregorian date
    NSDateComponents *gregorianComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    
    
    
    
    gregorianComponents.day = [gregorianComponents day];
    gregorianComponents.month = [gregorianComponents month];
    gregorianComponents.year = [gregorianComponents year];
    
    // Create the date
    NSDate *date = [gregorianCalendar dateFromComponents:gregorianComponents];
    
    
    
    // Then create an Islamic calendar
    NSCalendar *hijriCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierIslamicCivil];
    
    // And grab those date components for the same date
    NSDateComponents *hijriComponents = [hijriCalendar components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:date];
    
    
    
    
    return [hijriComponents year];
}


+(NSInteger)getHijriDayNumber{
    
    
    
    
    // Create a Gregorian Calendar
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    // Set up components of a Gregorian date
    NSDateComponents *gregorianComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    
    
    
    
    gregorianComponents.day = [gregorianComponents day];
    gregorianComponents.month = [gregorianComponents month];
    gregorianComponents.year = [gregorianComponents year];
    
    // Create the date
    NSDate *date = [gregorianCalendar dateFromComponents:gregorianComponents];
    // Then create an Islamic calendar
    NSCalendar *hijriCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierIslamicCivil];
    
    // And grab those date components for the same date
    NSDateComponents *hijriComponents = [hijriCalendar components:(NSCalendarUnitDay |NSCalendarUnitMonth |NSCalendarUnitYear)fromDate:date];
    
    
    
    NSDateFormatter *dayOfWeek;
    
    dayOfWeek=[[NSDateFormatter alloc]init];
    [dayOfWeek setDateFormat:@"EEE"];
    
    return [hijriComponents day];
    
    
}



+(NSInteger)getHijriMonthNumber{
    
    // Create a Gregorian Calendar
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    // Set up components of a Gregorian date
    NSDateComponents *gregorianComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    
    
    gregorianComponents.day = [gregorianComponents day];
    gregorianComponents.month = [gregorianComponents month];
    gregorianComponents.year = [gregorianComponents year];
    
    // Create the date
    NSDate *date = [gregorianCalendar dateFromComponents:gregorianComponents];
    
    
    
    // Then create an Islamic calendar
    NSCalendar *hijriCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierIslamicCivil];
    
    // And grab those date components for the same date
    NSDateComponents *hijriComponents = [hijriCalendar components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:date];
    
    
    
    
    return [hijriComponents month];
    
}



#pragma mark - Get Name Of Month


+(NSString*)getShamsiMonthNameWithShamsiDate : (CalendarType*) ShamsiDate{
    
    NSString *result=@"1";
  
    NSInteger ShamsiMonth = ShamsiDate.month ;
    
    
    
    if (ShamsiMonth==1) {
        result=@"Farvardin";
    }
    
    if (ShamsiMonth==2) {
        result=@"Ordibehesht";
    }
    if (ShamsiMonth==3) {
        result=@"Khordad";
    }
    if (ShamsiMonth==4) {
        result=@"Tir";
    }
    if (ShamsiMonth==5) {
        result=@"Mordad";
    }
    if (ShamsiMonth==6) {
        result=@"Shahriver";
    }
    if (ShamsiMonth==7) {
        result=@"Mehr";
    }
    
    if (ShamsiMonth==8) {
        result=@"Aban";
    }
    
    if (ShamsiMonth==9) {
        result=@"Azar";
    }
    
    if (ShamsiMonth==10) {
        result=@"Dey";
    }
    
    if (ShamsiMonth==11) {
        result=@"Bahman";
    }
    if (ShamsiMonth==12) {
        result=@"Isfand";
    }
    
    return result;
}

+(NSString *)getMiladiMonthNameWithMiladiDate:(CalendarType*)MiladiDate{
    
    
    NSString *result=@"1";
    
    NSInteger MiladiMonth = MiladiDate.month;
    
    
    if (MiladiMonth==1) {
        result=@"January";
    }
    
    if (MiladiMonth==2) {
        result=@"Febuary";
    }
    if (MiladiMonth==3) {
        result=@"March";
    }
    if (MiladiMonth==4) {
        result=@"April";
    }
    if (MiladiMonth==5) {
        result=@"May";
    }
    if (MiladiMonth==6) {
        result=@"June";
    }
    if (MiladiMonth==7) {
        result=@"July";
    }
    
    if (MiladiMonth==8) {
        result=@"August";
    }
    
    if (MiladiMonth==9) {
        result=@"September";
    }
    
    if (MiladiMonth==10) {
        result=@"October";
    }
    
    if (MiladiMonth==11) {
        result=@"November";
    }
    if (MiladiMonth==12) {
        result=@"December";
    }
    
    return result;
}



+(NSString*)getHijriMonthNameWithHijriDate : (CalendarType*) HijriDate{
    
    NSString *result=@"1";
    
    NSInteger HijriMonth = HijriDate.month ;
    
    
    
    if (HijriMonth==1) {
        result=@"Moharam";
    }
    
    if (HijriMonth==2) {
        result=@"Safar";
    }
    if (HijriMonth==3) {
        result=@"Rabi Aval";
    }
    if (HijriMonth==4) {
        result=@"Rabi Sani";
    }
    if (HijriMonth==5) {
        result=@"Jamadi Aval";
    }
    if (HijriMonth==6) {
        result=@"Jamadi Sani";
    }
    if (HijriMonth==7) {
        result=@"Rajab";
    }
    
    if (HijriMonth==8) {
        result=@"Shaban";
    }
    
    if (HijriMonth==9) {
        result=@"Ramazhan Karim";
    }
    
    if (HijriMonth==10) {
        result=@"shoval ";
    }
    
    if (HijriMonth==11) {
        result=@"zi ghade";
    }
    if (HijriMonth==12) {
        result=@"zi haje";
    }
    
    return result;
    
    
}

#pragma mark - GetDayOfWeek


+(NSInteger)getDayOfWeekIndexWithMideDay : (NSString*) miladiDte{
    NSInteger result=0;
    
    NSDate *myDate=[[NSDate alloc]init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    myDate=[dateFormatter dateFromString:miladiDte];
    
    
    
    NSDateFormatter *dayOfWeek;
    
    dayOfWeek=[[NSDateFormatter alloc]init];
    [dayOfWeek setDateFormat:@"EEE"];
    
    NSString *strDay=[dayOfWeek stringFromDate:myDate];
    
    
    if ([strDay isEqualToString:@"Sun"]) {
        result=0;
    }
    
    if ([strDay isEqualToString:@"Mon"]) {
        result=1;
    }
    
    if ([strDay isEqualToString:@"Tue"]) {
        result=2;
    }
    
    if ([strDay isEqualToString:@"Wed"]) {
        result=3;
    }
    
    if ([strDay isEqualToString:@"Thu"]) {
        result=4;
    }
    
    if ([strDay isEqualToString:@"Fri"]) {
        result=5;
    }
    
    if ([strDay isEqualToString:@"Sat"]) {
        result=6;
    }
    
    
    
    
    return result;
}


#pragma mark - Convert To MiladiDate
+(CalendarType*)ConvertShamsiDateToMiladiDate : (CalendarType*) ShamsiDate{
   
    CalendarType *result = [[CalendarType alloc]init];
    result.day = 0;
    result.month = 0;
    result.year = 0;
    
    NSCalendar *shamsiCal=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierPersian];
    NSDateComponents *shamsiComponent=[[NSDateComponents alloc]init];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    
    
   // NSArray *components = [ShamsiDate componentsSeparatedByString:@"-"];
    
    
    NSInteger shamsiDay=ShamsiDate.day;
    NSInteger shamsiMonth=ShamsiDate.month;
    NSInteger shamsiYear=ShamsiDate.year;

    
    
    [shamsiComponent setYear:shamsiYear];
    [shamsiComponent setDay:shamsiDay];
    [shamsiComponent setMonth:shamsiMonth];
    
    
    NSDate *myShamsiDate=[shamsiCal dateFromComponents:shamsiComponent];

    
    
    NSDateComponents *gregorianComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:myShamsiDate];
    
    
    
    result.day = [gregorianComponents day];
    result.month = [gregorianComponents month];
    result.year = [gregorianComponents year];
    
    
    
    return result;
    
}



+(CalendarType*)ConvertHijriDateToMiladiDate : (CalendarType*) HijriDate{
    
  
    
    CalendarType *result = [[CalendarType alloc]init];
    result.day = 0;
    result.month = 0;
    result.year = 0;
    
    
    NSCalendar *HijriCal=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierIslamicCivil];
    NSDateComponents *hijriComponent=[[NSDateComponents alloc]init];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    
    
    //NSArray *components = [HijriDate componentsSeparatedByString:@"-"];
    
    
    NSInteger HijriDay=HijriDate.day;
    NSInteger HijriMonth=HijriDate.month;
    NSInteger HijriYear=HijriDate.year;
    
    
    [hijriComponent setYear:HijriYear];
    [hijriComponent setDay:HijriDay];
    [hijriComponent setMonth:HijriMonth];
    
    
    NSDate *myHijriDate=[HijriCal dateFromComponents:hijriComponent];
    
    
    NSDateComponents *gregorianComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:myHijriDate];
    
    
    
    result.day = [gregorianComponents day] ;
    result.month = [gregorianComponents month];
    result.year = [gregorianComponents year];
  
    
    return result;
}

+(CalendarType*)convertMiladiDateToShamsiDate :(CalendarType*) miladiDate{
    CalendarType *result = [[CalendarType alloc]init];
    result.day = 0;
    result.month = 0;
    result.year = 0;
    
    
    NSCalendar *miladiCal=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *miladiComponent=[[NSDateComponents alloc]init];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    
    
    //NSArray *components = [miladiDate componentsSeparatedByString:@"-"];
    
    
    NSInteger miladiDay=miladiDate.day;
    NSInteger miladiMonth=miladiDate.month;
    NSInteger miladiYear=miladiDate.year;
    
    
    [miladiComponent setYear:miladiYear];
    [miladiComponent setDay:miladiDay];
    [miladiComponent setMonth:miladiMonth];
    
    
    NSDate *myMiladiDate=[miladiCal dateFromComponents:miladiComponent];
    

    
  NSCalendar *persianCalendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierPersian];
    
    
//     NSDateComponents *persianComponents = [NSCalendarIdentifierPersian components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:myMiladiDate];
    
    
   
    NSDateComponents *persianComponents = [persianCalendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:myMiladiDate];
    
    
    
    
    result.day = [persianComponents day];
    result.month = [persianComponents month];
    result.year = [persianComponents year];
    

    
   
    
    return result;
}


+(CalendarType*)ConvertHijriDateToShamsiDate : (CalendarType*) hijriDate{
    
    CalendarType *result = [[CalendarType alloc]init];
    result.day = 0;
    result.month = 0;
    result.year = 0;
    
    CalendarType *miladiDate = [[CalendarType alloc]initWithDay:0 AndMonth:0 AndYear:0];
    
    miladiDate = [AZPersianCalendar ConvertHijriDateToMiladiDate:hijriDate];
    result = [AZPersianCalendar convertMiladiDateToShamsiDate:miladiDate];
    
    return result;
}
+(CalendarType*)ConvertShamsiDateToHijriDate : (CalendarType*) shamsiDate{
    
    CalendarType *result = [[CalendarType alloc]init];
    result.day = 0;
    result.month = 0;
    result.year = 0;
    
    
    CalendarType *miladiDate = [[CalendarType alloc]initWithDay:0 AndMonth:0 AndYear:0];
    
    miladiDate = [AZPersianCalendar ConvertShamsiDateToMiladiDate:shamsiDate];
    result = [AZPersianCalendar convertMiladiDateToHijriDate:miladiDate];

    
    return result;
    
}


+(CalendarType*)convertMiladiDateToHijriDate : (CalendarType*) miladiDate{
    
    CalendarType *result = [[CalendarType alloc]init];
    result.day = 0;
    result.month = 0;
    result.year = 0;
    
    
    NSCalendar *miladiCal=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *miladiComponent=[[NSDateComponents alloc]init];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    
    
   // NSArray *components = [miladiDate componentsSeparatedByString:@"-"];
    
    
    NSInteger miladiDay=miladiDate.day;
    NSInteger miladiMonth=miladiDate.month;
    NSInteger miladiYear=miladiDate.year;
    
    
    [miladiComponent setYear:miladiYear];
    [miladiComponent setDay:miladiDay];
    [miladiComponent setMonth:miladiMonth];
    
    
    NSDate *myMiladiDate=[miladiCal dateFromComponents:miladiComponent];
    
    
    
    NSCalendar *hijriCalendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierIslamicCivil];
    

    NSDateComponents *hijriComponents = [hijriCalendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:myMiladiDate];
    
    
    
       
    result.day = [hijriComponents day];
    result.month = [hijriComponents month];
    result.year = [hijriComponents year];
    

    
    
    return result;
}


#pragma mark - getNumberOfDayInMonth



+(NSInteger)getNumberOfDayInMiladiMonthWithMiladiYearAndMiladiMonth : (NSInteger) MiladiYear : (NSInteger) MiladiMonth{
    NSInteger result=0;
    
    if (MiladiYear%4==0) {
        // Kabise Year !
        
        
        
        switch (MiladiMonth) {
                
                
            case 1:
                result=31;
                break;
            case 2:
                result=29;
                break;
            case 3:
                result=31;
                break;
            case 4:
                result=30;
                break;
            case 5:
                result=31;
                break;
            case 6:
                result=30;
                break;
            case 7:
                result=31;
                break;
                
            case 8:
                result=31;
                break;
                
            case 9:
                result=30;
                break;
                
            case 10:
                result=31;
                break;
                
            case 11:
                result=30;
                break;
                
            case 12:
                result=31;
                break;
        }
        
        
        
        
    }else{
        // Non Kabise !
        
        
        
        switch (MiladiMonth) {
                
                
            case 1:
                result=31;
                break;
            case 2:
                result=28;
                break;
            case 3:
                result=31;
                break;
            case 4:
                result=30;
                break;
            case 5:
                result=31;
                break;
            case 6:
                result=30;
                break;
            case 7:
                result=31;
                break;
                
            case 8:
                result=31;
                break;
                
            case 9:
                result=30;
                break;
                
            case 10:
                result=31;
                break;
                
            case 11:
                result=30;
                break;
                
            case 12:
                result=31;
                break;
        }
        
        
    }
    
    
    return result;
    
    
}
+(NSInteger)geTNumberOfDayInShamsiMonthWithShamsiYearAndShamsiMonth : (NSInteger) ShamsiYear : (NSInteger) ShamsiMonth{
    
    NSInteger result=0;
    
    
    if (ShamsiYear%4==3) {
        // Kabise Year !
        
        switch (ShamsiMonth) {
                
                
            case 1:
                result=31;
                break;
            case 2:
                result=31;
                break;
            case 3:
                result=31;
                break;
            case 4:
                result=31;
                break;
            case 5:
                result=31;
                break;
            case 6:
                result=31;
                break;
            case 7:
                result=30;
                break;
                
            case 8:
                result=30;
                break;
                
            case 9:
                result=30;
                break;
                
            case 10:
                result=30;
                break;
                
            case 11:
                result=30;
                break;
                
            case 12:
                result=30;
                break;
        }
        
        
        
    }else{
        //Non Kabise !
        
        switch (ShamsiMonth) {
                
                
            case 1:
                result=31;
                break;
            case 2:
                result=31;
                break;
            case 3:
                result=31;
                break;
            case 4:
                result=31;
                break;
            case 5:
                result=31;
                break;
            case 6:
                result=31;
                break;
            case 7:
                result=30;
                break;
                
            case 8:
                result=30;
                break;
                
            case 9:
                result=30;
                break;
                
            case 10:
                result=30;
                break;
                
            case 11:
                result=30;
                break;
                
            case 12:
                result=29;
                break;
        }
        
        
        
    }
    
    
    return result;
    
    
}



+(NSInteger)getNumberOfDayInHijriMonthWithHijriYearAndHijriMonth : (NSInteger) HijriYear : (NSInteger) HijriMonth{
    NSInteger result=0;
    
    
    if (HijriYear%30==2 || HijriYear%30==5 || HijriYear%30==7 || HijriYear%30==10 || HijriYear%30==13 || HijriYear%30==16 || HijriYear%30==18 || HijriYear%30==21 || HijriYear%30==24 || HijriYear%30==26 || HijriYear%30==29) {
        // Kabiseh
        
        switch (HijriMonth) {
            case 1:
                result=30;
                break;
                
            case 2:
                result=29;
                break;
                
            case 3:
                result=30;
                break;
                
            case 4:
                result=29;
                break;
                
            case 5:
                result=30;
                break;
                
            case 6:
                result=29;
                break;
                
            case 7:
                result=30;
                break;
                
            case 8:
                result=29;
                break;
                
            case 9:
                result=30;
                break;
                
                
            case 10:
                result=29;
                break;
                
            case 11:
                result=30;
                break;
                
            case 12:
                result=30;
                break;
                
                
        }
        
        
    }else{
        // NonKabise !
        
        
        switch (HijriMonth) {
            case 1:
                result=30;
                break;
                
            case 2:
                result=29;
                break;
                
            case 3:
                result=30;
                break;
                
            case 4:
                result=29;
                break;
                
            case 5:
                result=30;
                break;
                
            case 6:
                result=29;
                break;
                
            case 7:
                result=30;
                break;
                
            case 8:
                result=29;
                break;
                
            case 9:
                result=30;
                break;
                
                
            case 10:
                result=29;
                break;
                
            case 11:
                result=30;
                break;
                
            case 12:
                result=29;
                break;
                
                
        }
        
        
        
    }
    
    
    return result;
}





@end
