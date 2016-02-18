//
//  ConvertorViewController.h
//  AZPersianCalendar
//
//  Created by Ali on 2/17/16.
//  Copyright © 2016 Ali Azadeh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AZPersianCalendar.h"
@interface ConvertorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *segCtrSource;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segCtrDestination;

@property (weak, nonatomic) IBOutlet UIButton *btnConvert;
- (IBAction)btnConvert:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *txtSourceDay;

@property (weak, nonatomic) IBOutlet UITextField *txtSourceMonth;

@property (weak, nonatomic) IBOutlet UITextField *txtSourceYear;


@property (weak, nonatomic) IBOutlet UITextField *txtDestinationDay;

@property (weak, nonatomic) IBOutlet UITextField *txtDestinationMonth;


@property (weak, nonatomic) IBOutlet UITextField *txtDestinationYear;


@property () NSString *convertedCalendar;


@property NSInteger convertorState;

// if 1  -> Georgian to Persian (Hijri Shamsi)
// if 2  -> Persian  To Georgian 


- (IBAction)segCtrSource:(id)sender;


- (IBAction)segCtrDestination:(id)sender;



@end
