//
//  ConvertorViewController.m
//  ObjSample
//
//  Created by Ali on 10/23/16.
//  Copyright © 2016 Ali Azadeh. All rights reserved.
//

#import "ConvertorViewController.h"
@import AZCalendarOBJC;
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
    
 //   convertMode mode = [self setConvertMode];
    
  //  DateType *originDate = [[CalendarType alloc]initWithDay:[_txtOriginDay.text integerValue] AndMonth:[_txtOriginMonth.text integerValue] AndYear:[_txtOriginYear.text integerValue]];
    
    DateType *originDate = [[DateType alloc] initWithDay:[_txtOriginDay.text integerValue] month:[_txtOriginMonth.text integerValue] year:[_txtOriginYear.text integerValue]];
    
    
    DateType *convertedDate = [[DateType alloc] initWithDay:0 month:0 year:0];
    
    CalendarType originCalendar = [self getOriginCalendar];
    CalendarType destinationCalendar = [self getDestinationCalendar];
    
  
    convertedDate = [AZCalendar convertDateWithInputType:originCalendar inputDate:originDate outputType:destinationCalendar];
    

    _txtDestinationDay.text = [NSString stringWithFormat:@"%ld",(long)convertedDate.day];
    _txtDestinationMonth.text = [NSString stringWithFormat:@"%ld",(long)convertedDate.month];
    _txtDestinationYear.text = [NSString stringWithFormat:@"%ld",(long)convertedDate.year];
}


-(CalendarType)getOriginCalendar{

    CalendarType result = persian;

    switch (_segCtrOrigin.selectedSegmentIndex) {
        case 0:
            result = gregorian;
            break;
       
            
        case 1:
            result = persian;
            break;
            
        case 2:
            result = hijri;
            break;
            
        default:
            break;
    }
    
    return  result;
}

-(CalendarType)getDestinationCalendar{


    CalendarType result = persian;
    
    switch (_segCtrOrigin.selectedSegmentIndex) {
        case 0:
            
            if (_segCtrDestination.selectedSegmentIndex == 0 ){
             result = persian;
            }else{
                 result = hijri;
            }
            
           
            break;
            
            
        case 1:
            
            if (_segCtrDestination.selectedSegmentIndex == 0 ){
                 result = gregorian;
            }else{
                 result = hijri;
            }

            
         
            break;
            
        case 2:
            
            if (_segCtrDestination.selectedSegmentIndex == 0 ){
                 result = gregorian;
            }else{
                 result = persian;
            }

            
          
            break;
            
        default:
            break;
    }
    
    return  result;

}



@end
