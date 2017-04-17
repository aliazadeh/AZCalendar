//
//  TodayViewController.m
//  ObjSample
//
//  Created by Ali on 10/23/16.
//  Copyright © 2016 Ali Azadeh. All rights reserved.
//

#import "TodayViewController.h"
@import AZCalendarOBJC;
@interface TodayViewController ()

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDate];
    [self setDayOfWeek];
    [self setMonthName];
   
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (void) setDate{

    

    
    DateType *todayGregorian = [AZCalendar getCurrentGregorianDate];
    DateType *todayPersian = [AZCalendar getCurrentPersianDate];
    DateType *todayHijri = [AZCalendar getCurrentHijriDate];
    
    switch ([_segCtrCalendarType selectedSegmentIndex]) {
        case 0:
            // Georgian
            _lblDay.text = [NSString stringWithFormat:@"%ld",(long)todayGregorian.day];
             _lblMonth.text = [NSString stringWithFormat:@"%ld",(long)todayGregorian.month];
             _lblYear.text = [NSString stringWithFormat:@"%ld",(long)todayGregorian.year];
            break;
            
        case 1 :
            // Persian
            _lblDay.text = [NSString stringWithFormat:@"%ld",(long)todayPersian.day];
            _lblMonth.text = [NSString stringWithFormat:@"%ld",(long)todayPersian.month];
            _lblYear.text = [NSString stringWithFormat:@"%ld",(long)todayPersian.year];
            break;
            
            case 2:
            // Hijri or Islamic
            _lblDay.text = [NSString stringWithFormat:@"%ld",(long)todayHijri.day];
             _lblMonth.text = [NSString stringWithFormat:@"%ld",(long)todayHijri.month];
             _lblYear.text = [NSString stringWithFormat:@"%ld",(long)todayHijri.year];
            break;

    }
  
}

-(void)setDayOfWeek{

    self.lblDayOfWeek.text = [AZCalendar getDayNameWithCalendar:gregorian date:[AZCalendar getCurrentGregorianDate]];
    
}

-(void)setMonthName{
    
    switch ([_segCtrCalendarType selectedSegmentIndex]) {
            
            case 0:
            _lblMonthName.text = [AZCalendar getMonthNameWithCalendar:gregorian date:[AZCalendar getCurrentGregorianDate]];
            break;
            case 1:
            _lblMonthName.text = [AZCalendar getMonthNameWithCalendar:persian date:[AZCalendar getCurrentPersianDate]];
            break;
            case 2:
            _lblMonthName.text = [AZCalendar getMonthNameWithCalendar:hijri date:[AZCalendar getCurrentHijriDate]];
            break;
            default:
            break;
            
    }

}




- (IBAction)changedCalendarMode:(id)sender {
    [self setDate];
    [self setDayOfWeek];
    [self setMonthName];
   
    
}
@end
