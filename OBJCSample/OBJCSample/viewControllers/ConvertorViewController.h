//
//  ConvertorViewController.h
//  ObjSample
//
//  Created by Ali on 10/23/16.
//  Copyright © 2016 Ali Azadeh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConvertorViewController : UIViewController





@property (weak, nonatomic) IBOutlet UITextField *txtOriginDay;

@property (weak, nonatomic) IBOutlet UITextField *txtOriginMonth;

@property (weak, nonatomic) IBOutlet UITextField *txtOriginYear;

@property (weak, nonatomic) IBOutlet UITextField *txtDestinationDay;

@property (weak, nonatomic) IBOutlet UITextField *txtDestinationMonth;
@property (weak, nonatomic) IBOutlet UITextField *txtDestinationYear;

@property () IBOutlet UISegmentedControl *segCtrOrigin;

@property () IBOutlet UISegmentedControl *segCtrDestination;


@end
