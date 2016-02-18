//
//  ConvertorViewController.m
//  AZPersianCalendar
//
//  Created by Ali on 2/17/16.
//  Copyright © 2016 Ali Azadeh. All rights reserved.
//

#import "ConvertorViewController.h"

@interface ConvertorViewController ()

@end

@implementation ConvertorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _segCtrDestination.selectedSegmentIndex = 1;
    _convertorState = 1;
    
    _txtDestinationDay.enabled = NO;
    _txtDestinationMonth.enabled = NO;
    _txtDestinationYear.enabled = NO;
    
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
- (IBAction)btnBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)btnConvert:(id)sender {
    
    UIAlertController *myAlertCtr = [[UIAlertController alloc]init];
    
    myAlertCtr = [UIAlertController alertControllerWithTitle:@"Error !" message:@"The Date That You Entered is Not Correct" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAct = [[UIAlertAction alloc]init];
    alertAct = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [myAlertCtr addAction:alertAct];
    
    
    if (_segCtrDestination.selectedSegmentIndex == _segCtrSource
        .selectedSegmentIndex) {
        
        _txtDestinationDay.text = _txtSourceDay.text;
        _txtDestinationMonth.text = _txtSourceMonth.text;
        _txtDestinationYear.text = _txtSourceYear.text;
        
    }else{
        
        
        if (_convertorState ==1) {
            
            
            if ([_txtSourceDay.text integerValue] >= 32 || [_txtSourceMonth.text integerValue]<=0 || [_txtSourceYear.text integerValue ]<=0 || [_txtSourceDay.text integerValue]<=0 || [_txtSourceMonth.text integerValue]>=13) {
                [self presentViewController:myAlertCtr animated:YES completion:nil];
            }else{
                if ([_txtSourceMonth.text integerValue]==1 || [_txtSourceMonth.text integerValue]==2 || [_txtSourceMonth.text integerValue]==4 || [_txtSourceMonth.text integerValue]==7) {
                    // Day <=29
                    
                    if ([_txtSourceDay.text integerValue] >=30) {
                        // Error !
                        [self presentViewController:myAlertCtr animated:YES completion:nil];
                    }else{
                        // Correct Form
                        
                        
                        _convertedCalendar = [AZPersianCalendar convertMiladiDateToShamsiDate:[NSString stringWithFormat:@"%@-%@-%@",_txtSourceDay.text,_txtSourceMonth.text,_txtSourceYear.text]];
                        [self getInfoAfterConvert:_convertedCalendar];
                    }
                }
                if([_txtSourceMonth.text integerValue]==6 || [_txtSourceMonth.text integerValue]==9 || [_txtSourceMonth.text integerValue]==11 || [_txtSourceMonth.text integerValue]==12){
                    // Day <=30
                    
                    if ([_txtSourceDay.text integerValue] >=31) {
                        // Error !
                        [self presentViewController:myAlertCtr animated:YES completion:nil];
                    }else{
                        // Correct Form
                        _convertedCalendar = [AZPersianCalendar convertMiladiDateToShamsiDate:[NSString stringWithFormat:@"%@-%@-%@",_txtSourceDay.text,_txtSourceMonth.text,_txtSourceYear.text]];
                        [self getInfoAfterConvert:_convertedCalendar];
                    }
                }
                if ([_txtSourceMonth.text integerValue]==3 || [_txtSourceMonth.text integerValue]==5 || [_txtSourceMonth.text integerValue]==8 || [_txtSourceMonth.text integerValue]==10) {
                    
                    _convertedCalendar = [AZPersianCalendar convertMiladiDateToShamsiDate:[NSString stringWithFormat:@"%@-%@-%@",_txtSourceDay.text,_txtSourceMonth.text,_txtSourceYear.text]];
                    [self getInfoAfterConvert:_convertedCalendar];
                    
                }
            }
           
            
        }
        
        if (_convertorState ==2) {
            
            
            // if Shamsi to Miladi
            
            if ([_txtSourceDay.text integerValue] >= 32 || [_txtSourceMonth.text integerValue]<=0 || [_txtSourceYear.text integerValue ]<=0 || [_txtSourceDay.text integerValue]<=0 || [_txtSourceMonth.text integerValue]>=13) {
                [self presentViewController:myAlertCtr animated:YES completion:nil];
            }else{
                
                
                if ([_txtSourceMonth.text integerValue] <= 6) {
                    
                    // Day <=31
                    
               
                    _convertedCalendar = [AZPersianCalendar ConvertShamsiDateToMiladiDate:[NSString stringWithFormat:@"%@-%@-%@",_txtSourceDay.text,_txtSourceMonth.text,_txtSourceYear.text]];
                    
                    
                  
                    
                    [self getInfoAfterConvert:_convertedCalendar];
                    
                }
                
                if ([_txtSourceMonth.text integerValue] <=11 && [_txtSourceMonth.text integerValue] >=7) {
                 
                    // Day <30
                    
                    if ([_txtSourceDay.text integerValue] <=30) {
                        
                        
                        _convertedCalendar = [AZPersianCalendar ConvertShamsiDateToMiladiDate:[NSString stringWithFormat:@"%@-%@-%@",_txtSourceDay.text,_txtSourceMonth.text,_txtSourceYear.text]];
                        
                        [self getInfoAfterConvert:_convertedCalendar];
                        
                    }else{
                         [self presentViewController:myAlertCtr animated:YES completion:nil];
                    }
                    
                    
                }
                
                
                
                if ([_txtSourceMonth.text integerValue] == 12) {
                    
                    if ([_txtSourceYear.text integerValue]%4==2) {
                        // Shamsi Kabise Year
                        if ([_txtSourceDay.text integerValue] <=30) {
                         // Correct
                            
                            _convertedCalendar = [AZPersianCalendar ConvertShamsiDateToMiladiDate:[NSString stringWithFormat:@"%@-%@-%@",_txtSourceDay.text,_txtSourceMonth.text,_txtSourceYear.text]];
                            
                            [self getInfoAfterConvert:_convertedCalendar];
                            
                        }else{
                            // Error
                             [self presentViewController:myAlertCtr animated:YES completion:nil];
                        }
                    }else{
                     
                        if ([_txtSourceDay.text integerValue] <=29) {
                            // Correct
                            
                            _convertedCalendar = [AZPersianCalendar ConvertShamsiDateToMiladiDate:[NSString stringWithFormat:@"%@-%@-%@",_txtSourceDay.text,_txtSourceMonth.text,_txtSourceYear.text]];
                            
                            [self getInfoAfterConvert:_convertedCalendar];
                            
                        }else{
                            // Error
                             [self presentViewController:myAlertCtr animated:YES completion:nil];
                        }
                        
                    }
                    
                    
                }
                
                
                
            }
            
            
        }
        
       
        
    }
    
}
- (IBAction)segCtrSource:(id)sender {
    
    if (_segCtrSource.selectedSegmentIndex ==0) {
        _segCtrDestination.selectedSegmentIndex =1;
    }else{
        _segCtrDestination.selectedSegmentIndex =0;
    }
    
    [self updateConvertorState];
}

- (IBAction)segCtrDestination:(id)sender {
    
    if (_segCtrDestination.selectedSegmentIndex == 0) {
        _segCtrSource.selectedSegmentIndex = 1;
    }else{
        _segCtrSource.selectedSegmentIndex = 0;
    }
    
    [self updateConvertorState];
}

- (void) updateConvertorState{
    
    
    _convertorState = 0;
    
    if (_segCtrSource.selectedSegmentIndex == 0) {
        
        
        
        if (_segCtrDestination.selectedSegmentIndex == 1) {
            _convertorState =1;
            
        }
        
        
    }
    
    
    if (_segCtrSource.selectedSegmentIndex == 1) {
        
        
        
        if (_segCtrDestination.selectedSegmentIndex == 0) {
            _convertorState = 2;
            
        }
        
        
    }
    
    
  
    
    
}


-(void) getInfoAfterConvert:(NSString*)convertedDate{
    
    NSArray *parserArray = [[NSArray alloc] initWithArray:[convertedDate componentsSeparatedByString:@"-"] copyItems:YES];
    
    _txtDestinationDay.text = [parserArray objectAtIndex:0];
    _txtDestinationMonth.text = [parserArray objectAtIndex:1];
    _txtDestinationYear.text = [parserArray objectAtIndex:2];
    
    
}

@end
