//
//  TodayViewController.h
//  ObjSample
//
//  Created by Ali on 10/23/16.
//  Copyright © 2016 Ali Azadeh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UILabel *lblDay;


@property (weak, nonatomic) IBOutlet UILabel *lblMonth;

@property (weak, nonatomic) IBOutlet UILabel *lblYear;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segCtrCalendarType;

@property (weak, nonatomic) IBOutlet UILabel *lblDayOfWeek;

@property (weak, nonatomic) IBOutlet UILabel *lblMonthName;

- (IBAction)changedCalendarMode:(id)sender;


@end
