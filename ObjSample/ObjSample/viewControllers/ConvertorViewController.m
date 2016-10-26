//
//  ConvertorViewController.m
//  ObjSample
//
//  Created by Ali on 10/23/16.
//  Copyright © 2016 Ali Azadeh. All rights reserved.
//

#import "ConvertorViewController.h"
#import "CalendarType.h"
@interface ConvertorViewController ()


@end

@implementation ConvertorViewController





- (void)viewDidLoad {
    [super viewDidLoad];
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


- (IBAction)segCtrOriginSelected:(id)sender {
    
    switch (_segCtrOrigin.selectedSegmentIndex) {
        case 0:
            [_segCtrDestination setTitle:@"Persian" forSegmentAtIndex:0];
            [_segCtrDestination setTitle:@"Hijri" forSegmentAtIndex:1];
            break;
        
        case 1:
            
            [_segCtrDestination setTitle:@"Georgian" forSegmentAtIndex:0];
            [_segCtrDestination setTitle:@"Hijri" forSegmentAtIndex:1];
            break;
            
        case 2:
            [_segCtrDestination setTitle:@"Georgian" forSegmentAtIndex:0];
            [_segCtrDestination setTitle:@"Persian" forSegmentAtIndex:1];
            break;
//        default:
//            break;
    }
    
}



- (IBAction)segCtrDestinationSelected:(id)sender {
}


- (IBAction)btnConvert:(id)sender {
    
    [self.view endEditing:YES];
    
    convertMode mode = [self setConvertMode];
    
    CalendarType *originDate = [[CalendarType alloc]initWithDay:[_txtOriginDay.text integerValue] AndMonth:[_txtOriginMonth.text integerValue] AndYear:[_txtOriginYear.text integerValue]];
    
    CalendarType *convertedDate = [[CalendarType alloc]initWithDay:0 AndMonth:0 AndYear:0];
    
    switch (mode) {
        case georgianToPersian:
            convertedDate = [AZPersianCalendar convertMiladiDateToShamsiDate:originDate];
            break;
        
        case georgianToHijri:
            convertedDate = [AZPersianCalendar convertMiladiDateToHijriDate:originDate];
            break;
            
        case persianToHijri:
            convertedDate = [AZPersianCalendar ConvertShamsiDateToHijriDate:originDate];
            break;
            
        case persianToGeorgian:
            convertedDate = [AZPersianCalendar ConvertShamsiDateToMiladiDate:originDate];
            break;
            
            case hijriToPersian:
            convertedDate = [AZPersianCalendar ConvertHijriDateToShamsiDate:originDate];
            break;
           
        case hijriToGeorgian:
            convertedDate = [AZPersianCalendar ConvertHijriDateToMiladiDate:originDate];
            break;
            
        default:
            break;
    }
    
    
    _txtDestinationDay.text = [NSString stringWithFormat:@"%ld",(long)convertedDate.day];
    _txtDestinationMonth.text = [NSString stringWithFormat:@"%ld",(long)convertedDate.month];
    _txtDestinationYear.text = [NSString stringWithFormat:@"%ld",(long)convertedDate.year];
}


- (convertMode) setConvertMode  {

    convertMode mode;
    switch (_segCtrOrigin.selectedSegmentIndex) {
        case 0:
            if ( _segCtrDestination.selectedSegmentIndex == 0 ) { /* Georgian to Persian */
                mode = georgianToPersian ;
            } else {/* Georgian to Hijri */   mode = georgianToHijri ;}
            break;
            
        case 1:
            if ( _segCtrDestination.selectedSegmentIndex == 0 ) { /* Persian to Georgian */
                mode = persianToGeorgian ;
            } else {/* Persian to Hijri */   mode = persianToHijri ;}
            break;
            
        case 2:
            if ( _segCtrDestination.selectedSegmentIndex == 0 ) { /* Hijri to Georgian */
                mode = hijriToGeorgian ;
            } else {/* Hijri to Persian */   mode = hijriToPersian ;}
            break;
            
        default:
            break;
    }

    return  mode;
}


@end
