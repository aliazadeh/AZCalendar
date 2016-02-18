//
//  ViewController.h
//  AZPersianCalendar
//
//  Created by Ali on 2/16/16.
//  Copyright © 2016 Ali Azadeh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AZPersianCalendar.h"
#import "AppDelegate.h"
@interface ViewController : UIViewController <UICollectionViewDelegate , UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *lblCustomNav;


@property (weak, nonatomic) IBOutlet UILabel *lblEvents;


@property (weak, nonatomic) IBOutlet UILabel *lblBackgroundEvents;

@property (weak, nonatomic) IBOutlet UIButton *btnConvert;

@property (strong,nonatomic) NSString *calendarMode;

@property () NSInteger nowDayShamsi;
@property () NSInteger nowDayMiladi;
@property () NSInteger nowDayHijri;

@property () NSInteger nowMonthMiladi;
@property () NSInteger nowMonthShamsi;
@property () NSInteger nowMonthHijri;

@property () NSInteger nowYearShamsi;
@property () NSInteger nowYearMiladi;
@property () NSInteger nowYearHijri;



@property () NSString *HijriMonthTitle;
@property () NSString *ShamsiMonthTitle;
@property () NSString *MiladiMonthTitle;

@property () NSInteger FirsDayOfWeekMiladi;
@property () NSInteger FirsDayOfWeekShamsi;
@property () NSInteger FirsDayOfWeekHijri;





@property () NSInteger SelectedMiladiDay;
@property () NSInteger SelectedShamsiDay;
@property () NSInteger SelectedHijriDay;

@property () NSInteger SelectedShamsiMonth;
@property () NSInteger SelectedMiladiMonth;
@property () NSInteger SelectedHijriMonth;


@property () NSInteger SelectedShamsiYear;
@property () NSInteger SelectedHijriYear;
@property () NSInteger SelectedMiladiYear;

@property (weak, nonatomic) IBOutlet UILabel *lblBackgroundClendar;

@property (weak, nonatomic) IBOutlet UIButton *btnNextMonth;

@property (weak, nonatomic) IBOutlet UIButton *btnPerviousMonth;


- (IBAction)btnNextMonth:(id)sender;

- (IBAction)btnPerviousMonth:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnChangeToHijriMode;
- (IBAction)btnChangeToHijriMode:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *btnChangeToShamsiMode;

@property (weak, nonatomic) IBOutlet UIButton *btnChangeToMiladiMode;

- (IBAction)btnChangeToMiladiMode:(id)sender;

- (IBAction)btnChangeToShamsiMode:(id)sender;
@end

