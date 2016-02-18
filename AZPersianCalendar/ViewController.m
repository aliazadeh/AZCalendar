//
//  ViewController.m
//  AZPersianCalendar
//
//  Created by Ali on 2/16/16.
//  Copyright © 2016 Ali Azadeh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getTodayInfo];
    [self setUserCalendarMode];
    [_collectionView reloadData];
    [self autoLayout];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 42;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *cellStracture;
    cellStracture=@"MyCell";
    UICollectionViewCell *cell=[[UICollectionViewCell alloc]init];
    cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellStracture forIndexPath:indexPath];
    
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, cell.bounds.size.width, cell.bounds.size.width)];
    
    title.tag = 200;
    title.backgroundColor=[UIColor greenColor];
    title.textAlignment=NSTextAlignmentCenter;
    [cell.contentView addSubview:title];
    
    
    NSInteger PersianController=[AZPersianCalendar geTNumberOfDayInShamsiMonthWithShamsiYearAndShamsiMonth:_SelectedShamsiYear :_SelectedShamsiMonth];
    
    
    NSInteger EnglishController=[AZPersianCalendar getNumberOfDayInMiladiMonthWithMiladiYearAndMiladiMonth:_SelectedMiladiYear :_SelectedMiladiMonth];
    
    
    NSInteger ArabicController=[AZPersianCalendar getNumberOfDayInHijriMonthWithHijriYearAndHijriMonth:_SelectedHijriYear :_SelectedHijriMonth];
    
    
    if (indexPath.row<=6) {
        
        
        title.backgroundColor=[self colorWithHexString:@"70AFC8"];
        title.textColor=[self colorWithHexString:@"79B8D1"];
        
        if (indexPath.row==0) {
            title.text=@"Sun";
            title.textColor=[UIColor whiteColor];
        }
        
        if (indexPath.row==1) {
            title.text=@"Mon";
            title.textColor=[UIColor whiteColor];
        }
        
        if (indexPath.row==2) {
            title.text=@"Tue";
            title.textColor=[UIColor whiteColor];
        }
        
        if (indexPath.row==3) {
            title.text=@"Wed";
            title.textColor=[UIColor whiteColor];
        }
        
        if (indexPath.row==4) {
            title.text=@"Thu";
            title.textColor=[UIColor whiteColor];
        }
        
        if (indexPath.row==5) {
            title.text=@"Fri";
            title.textColor=[UIColor whiteColor];
        }
        
        if (indexPath.row==6) {
            title.text=@"Sat";
            title.textColor=[UIColor whiteColor];
        }
        
        
        
    }
    
    
    
    
    
    if ([_calendarMode isEqualToString:@"English"]) {
        
        
        if (indexPath.row>=7 && indexPath.row-7 < _FirsDayOfWeekMiladi) {
            title.backgroundColor=[self colorWithHexString:@"70AFC8"];
        }
        
        if (indexPath.row>=7+_FirsDayOfWeekMiladi) {
            
            
            if (indexPath.row-(6+_FirsDayOfWeekMiladi)<=EnglishController) {
                title.text=[NSString stringWithFormat:@"%li",indexPath.row-(6+_FirsDayOfWeekMiladi)];
                title.backgroundColor=[self colorWithHexString:@"85C5DE"];
                title.textColor=[self colorWithHexString:@"4C4C4C"];
            }else{
                
                title.backgroundColor=[self colorWithHexString:@"70AFC8"];
            }
            
            
            
        }
        
        
        if (_nowDayMiladi==[title.text integerValue]) {
            title.backgroundColor=[self colorWithHexString:@"E45D67"];
            title.textColor=[UIColor whiteColor];
        }
        
    }
    
    
    if ([_calendarMode isEqualToString:@"Persian"]) {
        
        if (indexPath.row>=7 && indexPath.row-7 < _FirsDayOfWeekShamsi) {
            title.backgroundColor=[self colorWithHexString:@"70AFC8"];
        }
        
        
        if (indexPath.row>=7+_FirsDayOfWeekShamsi) {
            
            if (indexPath.row-(6+_FirsDayOfWeekShamsi)<=PersianController) {
                title.text=[NSString stringWithFormat:@"%li",indexPath.row-(6+_FirsDayOfWeekShamsi)];
                title.backgroundColor=[self colorWithHexString:@"85C5DE"];
                title.textColor=[self colorWithHexString:@"4C4C4C"];
            }else{
                title.backgroundColor=[self colorWithHexString:@"70AFC8"];
            }
            
            
            
        }
        if (_nowDayShamsi==[title.text integerValue]) {
            title.backgroundColor=[self colorWithHexString:@"E45D67"];
            title.textColor=[UIColor whiteColor];
        }
        
    }
    
    
    if ([_calendarMode isEqualToString:@"Arabic"]) {
        
        
        if (indexPath.row>=7 && indexPath.row-7 < _FirsDayOfWeekHijri) {
            title.backgroundColor=[self colorWithHexString:@"70AFC8"];
            
        }
        
        if (indexPath.row >=7+_FirsDayOfWeekHijri) {
            
            if (indexPath.row-(6+_FirsDayOfWeekHijri)<=ArabicController) {
                title.text=[NSString stringWithFormat:@"%li",indexPath.row-(6+_FirsDayOfWeekHijri)];
                title.backgroundColor=[self colorWithHexString:@"85C5DE"];
                title.textColor=[self colorWithHexString:@"4C4C4C"];
                
            }else{
                title.backgroundColor=[self colorWithHexString:@"70AFC8"];
            }
            
            /*   title.text=[NSString stringWithFormat:@"%li",indexPath.row-(6+_FirsDayOfWeekHijri)];
             title.backgroundColor=[self colorWithHexString:@"85C5DE"];
             title.textColor=[self colorWithHexString:@"4C4C4C"];*/
            
        }
        
        
        
        if (_nowDayHijri==[title.text integerValue]) {
            title.backgroundColor=[self colorWithHexString:@"E45D67"];
            title.textColor=[UIColor whiteColor];
        }
        
    }
    
    
    return cell;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UIScreen *myScreen=[UIScreen mainScreen];
    CGFloat ScreenHight=myScreen.bounds.size.height;
    
    CGSize MySize;
    
    if (ScreenHight <= 485) {
        // Iphone 4 and 4s
        
        
        MySize=CGSizeMake(41.1f, 33.0f);
        
        
        
        
        
    }
    
    if (ScreenHight >= 485 && ScreenHight <= 570) {
        // iphone 5 and 5s
        MySize=CGSizeMake(41.4f, 39.3f);
        
    }
    
    
    if (ScreenHight >= 570 && ScreenHight <=670) {
        // iphone 6
        MySize=CGSizeMake(48.5f, 46.3f);
    }
    
    
    if (ScreenHight >= 680 && ScreenHight <=740) {
        // iphone 6 plus
        
        MySize=CGSizeMake(53.8f, 51.35f);
        
    }
    
    // Size=CGSizeMake(30, 30);
    return MySize;
    
}



-(UIColor*)colorWithHexString:(NSString*)hex
{
    
    
    
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}



-(void)getTodayInfo{
    
    _nowDayHijri=[AZPersianCalendar getHijriDayNumber];
    _nowMonthHijri=[AZPersianCalendar getHijriMonthNumber];
    _nowYearHijri=[AZPersianCalendar getHijriYearNumber];
    
    
    _nowDayShamsi=[AZPersianCalendar getShamsiDayNumber];
    _nowMonthShamsi=[AZPersianCalendar getShamsiMonthNumber];
    _nowYearShamsi=[AZPersianCalendar getShamsiYearNumber];
    
    _nowDayMiladi=[AZPersianCalendar getMiladiDayNumber];
    _nowMonthMiladi=[AZPersianCalendar getMiladiMonthNumber];
    _nowYearMiladi=[AZPersianCalendar getMiladiYearNumber];
    
    //  _FirsDayOfWeekMiladi=[CalendarManager getDayOfWeekIndexWithMideDay:[NSString stringWithFormat:@"01-%li-%li",[CalendarManager getMiladiMonthNumber],[CalendarManager getMiladiYearNumber]]];
    
    NSString *myStr0=[NSString stringWithFormat:@"01-%li-%li",_nowMonthMiladi,_nowYearMiladi];
    
    _FirsDayOfWeekMiladi=[AZPersianCalendar getDayOfWeekIndexWithMideDay:myStr0];
    
    
    NSString *myStr1=[NSString stringWithFormat:@"01-%li-%li",_nowMonthShamsi,_nowYearShamsi];
    
    NSString *equalMiladiDate1=[AZPersianCalendar ConvertShamsiDateToMiladiDate:myStr1];
    
    
    _FirsDayOfWeekShamsi=[AZPersianCalendar getDayOfWeekIndexWithMideDay:equalMiladiDate1];
    
    
    
    NSString *myStr2=[NSString stringWithFormat:@"01-%li-%li",_nowMonthHijri,_nowYearHijri];
    
    NSString *equalMiladiDate2=[AZPersianCalendar ConvertHijriDateToMiladiDate:myStr2];
    
    
    _FirsDayOfWeekHijri=[AZPersianCalendar getDayOfWeekIndexWithMideDay:equalMiladiDate2];
    
    
    _SelectedHijriDay=_nowDayHijri;
    _SelectedHijriMonth=_nowMonthHijri;
    _SelectedHijriYear=_nowYearHijri;
    
    _SelectedShamsiDay=_nowDayShamsi;
    _SelectedShamsiMonth=_nowMonthShamsi;
    _SelectedShamsiYear=_nowYearShamsi;
    
    _SelectedMiladiDay=_nowDayMiladi;
    _SelectedMiladiMonth=_nowMonthMiladi;
    _SelectedMiladiYear=_nowYearMiladi;
    
    
    
    // NSLog(@"Convert shode is : %",[CalendarManager ConvertShamsiDateToMiladiDate:@"12-11-1394"]);
    
    
    
    //NSLog(@"Hijri is \n %li-%li-%li",_nowDayHijri,_nowMonthHijri,_nowYearHijri);
    
    //  NSLog(@"Shamsi Info is : \n %li-%li-%li",_nowDayShamsi,_nowMonthShamsi,_nowYearShamsi);
    
    
    NSString *tempStr0=[NSString stringWithFormat:@"%li-%li-%li",_nowDayMiladi,_nowMonthMiladi,_nowYearMiladi];
    
    
    NSString *tempStr1=[NSString stringWithFormat:@"%li-%li-%li",_nowDayShamsi,_nowMonthShamsi,_nowYearShamsi];
    
    
    NSString *tempStr2=[NSString stringWithFormat:@"%li-%li-%li",_nowDayHijri,_nowMonthHijri,_nowYearHijri];
    
    [_btnChangeToMiladiMode setTitle:[NSString stringWithFormat:@"%@  %li",[AZPersianCalendar getMiladiMonthNameWithMiladiDate:tempStr0],_nowYearMiladi] forState:UIControlStateNormal];
    [_btnChangeToShamsiMode setTitle:[NSString stringWithFormat:@"%@  %li",[AZPersianCalendar getShamsiMonthNameWithShamsiDate:tempStr1],_nowYearShamsi] forState:UIControlStateNormal];
    
    [_btnChangeToHijriMode setTitle:[NSString stringWithFormat:@"%@  %li",[AZPersianCalendar getHijriMonthNameWithHijriDate:tempStr2],_nowYearHijri] forState:UIControlStateNormal];
    
    
    
    
    
    
    
}





- (IBAction)btnNextMonth:(id)sender {
    
    if (_SelectedMiladiMonth<12) {
        _SelectedMiladiMonth++;
    }else{
        _SelectedMiladiMonth=1;
        _SelectedMiladiYear++;
    }
    
    
    
    
    if (_SelectedShamsiMonth<12) {
        _SelectedShamsiMonth++;
    }else{
        _SelectedShamsiMonth=1;
        _SelectedShamsiYear++;
    }
    
    
    
    
    if (_SelectedHijriMonth<12) {
        _SelectedHijriMonth++;
    }else{
        _SelectedHijriMonth=1;
        _SelectedHijriYear++;
    }
    
    
    [self updateStatus];
    [_collectionView reloadData];
    
}

- (IBAction)btnPerviousMonth:(id)sender {
    
    if (_SelectedMiladiMonth>1) {
        _SelectedMiladiMonth=_SelectedMiladiMonth-1;
    }else{
        _SelectedMiladiMonth=12;
        _SelectedMiladiYear=_SelectedMiladiYear-1;
    }
    
    
    if (_SelectedShamsiMonth>1) {
        _SelectedShamsiMonth=_SelectedShamsiMonth-1;
    }else{
        _SelectedShamsiMonth=12;
        _SelectedShamsiYear--;
    }
    
    if (_SelectedHijriMonth>1) {
        _SelectedHijriMonth=_SelectedHijriMonth-1;
    }else{
        _SelectedHijriMonth=12;
        _SelectedHijriYear--;
    }
    
    
    
    [self updateStatus];
    [_collectionView reloadData];
    
    
}
- (IBAction)btnChangeToMiladiMode:(id)sender {
    AppDelegate *myApp=[UIApplication sharedApplication].delegate;
    NSString *plistInfo=[[myApp documentsPath] stringByAppendingString:@"/MySetting.plist"];
    NSMutableDictionary *myDict=[[NSMutableDictionary alloc]initWithContentsOfFile:plistInfo];
    
    [myDict setObject:@"English" forKey:@"Default"];
    
    
    if (![[myDict objectForKey:@"Top"]isEqualToString:@"English"]) {
        
        NSString *controllerString=@"";
        if ([[myDict objectForKey:@"Right"] isEqualToString:@"English"]) {
            controllerString=[myDict objectForKey:@"Top"];
            [myDict setObject:@"English" forKey:@"Top"];
            [myDict setObject:controllerString forKey:@"Right"];
            
        }
        
        if ([[myDict objectForKey:@"Left"]isEqualToString:@"English"]) {
            controllerString=[myDict objectForKey:@"Top"];
            [myDict setObject:@"English" forKey:@"Top"];
            [myDict setObject:controllerString forKey:@"Left"];
        }
    }
    
    
    if ([myDict writeToFile:plistInfo atomically:YES]) {
        
        _calendarMode=@"English";
        
    }
    [self autoLayout];
    
    
    // RKNotificationHub* hub = [[RKNotificationHub alloc]initWithView:_imgViewNotification]; // sets the count to 0
    // [self.view addSubview:hub];
    // [hub increment];
    // [hub pop];
    
    
    
    
    [_collectionView reloadData];
}

- (IBAction)btnChangeToShamsiMode:(id)sender {
    AppDelegate *myApp=[UIApplication sharedApplication].delegate;
    NSString *plistInfo=[[myApp documentsPath] stringByAppendingString:@"/MySetting.plist"];
    NSMutableDictionary *myDict=[[NSMutableDictionary alloc]initWithContentsOfFile:plistInfo];
    
    [myDict setObject:@"Persian" forKey:@"Default"];
    
    if (![[myDict objectForKey:@"Top"]isEqualToString:@"Persian"]) {
        // ya Right is Persian ya Left is Persian
        
        NSString *controllerString=@"";
        
        if ([[myDict objectForKey:@"Right"] isEqualToString:@"Persian"]) {
            controllerString=[myDict objectForKey:@"Top"];
            [myDict setObject:@"Persian" forKey:@"Top"];
            [myDict setObject:controllerString forKey:@"Right"];
            
        }
        
        if ([[myDict objectForKey:@"Left"]isEqualToString:@"Persian"]) {
            controllerString=[myDict objectForKey:@"Top"];
            [myDict setObject:@"Persian" forKey:@"Top"];
            [myDict setObject:controllerString forKey:@"Left"];
        }
        
    }
    
    
    
    if ([myDict writeToFile:plistInfo atomically:YES]) {
        _calendarMode=@"Persian";
    }
    
    [self autoLayout];
    [_collectionView reloadData];
    

}
- (IBAction)btnChangeToHijriMode:(id)sender {
    AppDelegate *myApp=[UIApplication sharedApplication].delegate;
    NSString *plistInfo=[[myApp documentsPath] stringByAppendingString:@"/MySetting.plist"];
    NSMutableDictionary *myDict=[[NSMutableDictionary alloc]initWithContentsOfFile:plistInfo];
    
    [myDict setObject:@"Arabic" forKey:@"Default"];
    
    if (![[myDict objectForKey:@"Top"]isEqualToString:@"Arabic"]) {
        NSString *controllerString=@"";
        
        if ([[myDict objectForKey:@"Right"] isEqualToString:@"Arabic"]) {
            controllerString=[myDict objectForKey:@"Top"];
            [myDict setObject:@"Arabic" forKey:@"Top"];
            [myDict setObject:controllerString forKey:@"Right"];
            
        }
        
        if ([[myDict objectForKey:@"Left"]isEqualToString:@"Arabic"]) {
            controllerString=[myDict objectForKey:@"Top"];
            [myDict setObject:@"Arabic" forKey:@"Top"];
            [myDict setObject:controllerString forKey:@"Left"];
        }
        
        
    }
    
    
    if ([myDict writeToFile:plistInfo atomically:YES]) {
        _calendarMode=@"Arabic";
    }
    
    
    [self updateStatus];
    [_collectionView reloadData];
    [self autoLayout];
    

}


-(void)updateStatus{
    
    
    NSString *detailHijri=[NSString stringWithFormat:@"%li-%li-%li",_SelectedHijriDay,_SelectedHijriMonth,_SelectedHijriYear];
    NSString *detailMiladi=[NSString stringWithFormat:@"%li-%li-%li",_SelectedMiladiDay,_SelectedMiladiMonth,_SelectedMiladiYear];
    NSString *detailShamsi=[NSString stringWithFormat:@"%li-%li-%li",_SelectedShamsiDay,_SelectedShamsiMonth,_SelectedShamsiYear];
    
    NSString *hijriState=[NSString stringWithFormat:@"%@  %li",[AZPersianCalendar getHijriMonthNameWithHijriDate:detailHijri],_SelectedHijriYear];
    NSString *ShamsiState=[NSString stringWithFormat:@"%@  %li",[AZPersianCalendar getShamsiMonthNameWithShamsiDate:detailShamsi],_SelectedShamsiYear];
    NSString *MiladiState=[NSString stringWithFormat:@"%@  %li",[AZPersianCalendar getMiladiMonthNameWithMiladiDate:detailMiladi],_SelectedMiladiYear];
    
    
    [_btnChangeToHijriMode setTitle:hijriState forState:UIControlStateNormal];
    [_btnChangeToMiladiMode setTitle:MiladiState forState:UIControlStateNormal];
    [_btnChangeToShamsiMode setTitle:ShamsiState forState:UIControlStateNormal];
    
    
    
    _FirsDayOfWeekMiladi=[AZPersianCalendar getDayOfWeekIndexWithMideDay:[NSString stringWithFormat:@"01-%li-%li",_SelectedMiladiMonth,_SelectedMiladiYear]];
    
    NSString *firstShamsi=[NSString stringWithFormat:@"01-%li-%li",_SelectedShamsiMonth,_SelectedShamsiYear];
    
    NSString *firstHijri=[NSString stringWithFormat:@"01-%li-%li",_SelectedHijriMonth,_SelectedHijriYear];
    
    
    NSString *equalMiladi0=[AZPersianCalendar ConvertShamsiDateToMiladiDate:firstShamsi];
    NSString *equalMiladi1=[AZPersianCalendar ConvertHijriDateToMiladiDate:firstHijri];
    
    
    
    _FirsDayOfWeekShamsi=[AZPersianCalendar getDayOfWeekIndexWithMideDay:equalMiladi0];
    _FirsDayOfWeekHijri=[AZPersianCalendar getDayOfWeekIndexWithMideDay:equalMiladi1];
    
    
    
}



-(void)autoLayout{
    
    _lblBackgroundClendar.backgroundColor=[self colorWithHexString:@"E5E7E8"];
     _lblBackgroundEvents.backgroundColor=[self colorWithHexString:@"E5E7E8"];
    
    // _btnPrayer.backgroundColor=[UIColor purpleColor];
    
    // _btnPrayer.backgroundColor=[ui];
    
    //_lblNotificationDetail.backgroundColor=[UIColor orangeColor];
    
    
    // *********************
    
   
    
    
    // _lblTitleFirstSection.backgroundColor=[UIColor orangeColor];
    // _lblTitleSecondeSection.backgroundColor=[UIColor orangeColor];
    
    
    
    
    AppDelegate *MyApp=[UIApplication sharedApplication].delegate;
    NSString *plistPath=[[MyApp documentsPath] stringByAppendingString:@"/MySetting.plist"];
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    
    _btnChangeToHijriMode.backgroundColor=[UIColor clearColor];
    _btnChangeToMiladiMode.backgroundColor=[UIColor clearColor];
    _btnChangeToShamsiMode.backgroundColor=[UIColor clearColor];
    
    //_btnChangeToHijriMode.backgroundColor=[UIColor purpleColor];
    //_btnChangeToMiladiMode.backgroundColor=[UIColor purpleColor];
    // _btnChangeToShamsiMode.backgroundColor=[UIColor purpleColor];
    
    _btnChangeToHijriMode.titleLabel.textAlignment=NSTextAlignmentCenter;
    _btnChangeToMiladiMode.titleLabel.textAlignment=NSTextAlignmentCenter;
    _btnChangeToShamsiMode.titleLabel.textAlignment=NSTextAlignmentCenter;
    
    [_btnNextMonth setTitle:@"" forState:UIControlStateNormal];
    [_btnPerviousMonth setTitle:@"" forState:UIControlStateNormal];
    
   // _imgViewNextMonth.image=[UIImage imageNamed:@"direction129(2).png"];
    
    
    
    self.collectionView.layer.masksToBounds=YES;
    self.collectionView.layer.cornerRadius=15;
    
    
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
    
    
    
   
    
    
    
    [self.lblBackgroundClendar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.lblBackgroundClendar];
    
//    [self.lblCustomNav setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [self.view addSubview:self.lblCustomNav];
//  
//    
    
    [self.lblCustomNav setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.lblCustomNav];
   
    
    [self.collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.collectionView];
    
    
    
    [self.btnChangeToHijriMode setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.btnChangeToHijriMode];
    
    
    [self.btnChangeToMiladiMode setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.btnChangeToMiladiMode];
    
    
    [self.btnChangeToShamsiMode setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.btnChangeToShamsiMode];
    
    
    [self.btnNextMonth setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.btnNextMonth];
    
    [self.btnPerviousMonth setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.btnPerviousMonth];
    
    
    
    [self.lblBackgroundEvents setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.lblBackgroundEvents];
    
    [self.lblEvents setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.lblEvents];
    
    [self.btnConvert setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.btnConvert];
    
    
    // [_txtDetail1 setScrollEnabled:YES];
    // [_scrollDetail1 setContentSize:CGSizeMake(320, 110)];
    
    
    // [_scrollDetail2 setScrollEnabled:YES];
    // [_scrollDetail2 setContentSize:CGSizeMake(320, 110)];
    
    
    //_txtDetail1.backgroundColor=[UIColor purpleColor];
    // _txtDetail2.backgroundColor=[UIColor purpleColor];
    
    
    //_lblTitleSecondeSection.backgroundColor=[UIColor orangeColor];
    
    // Title For Sections :
    
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnConvert attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.12 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnConvert  attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.06 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnConvert attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX  multiplier:1.8 constant:0.0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnConvert attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeCenterY  multiplier:0.125 constant:0.0]];

    
    
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.lblCustomNav attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.lblCustomNav  attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.lblCustomNav attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX  multiplier:1 constant:0.0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.lblCustomNav attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeCenterY  multiplier:0.09 constant:0.0]];
    

    
    
    
    // ***
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.lblEvents attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.875 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.lblEvents  attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.lblEvents attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX  multiplier:1 constant:0.0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.lblEvents attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeCenterY  multiplier:1.475 constant:0.0]];
    
    // ***
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnNextMonth attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.1 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnNextMonth  attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.07 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnNextMonth attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX  multiplier:1.65 constant:0.0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnNextMonth attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeCenterY  multiplier:0.29 constant:0.0]];
    
    
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnPerviousMonth attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.1 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnPerviousMonth  attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.07 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnPerviousMonth attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX  multiplier:0.35 constant:0.0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnPerviousMonth attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeCenterY  multiplier:0.29 constant:0.0]];
    
    
    
    
    
    if ([[dict objectForKey:@"Top"]isEqualToString:@"English"]) {
        
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToMiladiMode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToMiladiMode  attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.05 constant:0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToMiladiMode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX  multiplier:1 constant:0.0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToMiladiMode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeCenterY  multiplier:0.295 constant:0.0]];
        
        
        
        
        
        
    }
    
    if ([[dict objectForKey:@"Top"]isEqualToString:@"Arabic"]) {
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToHijriMode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToHijriMode  attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.05 constant:0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToHijriMode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX  multiplier:1 constant:0.0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToHijriMode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeCenterY  multiplier:0.295 constant:0.0]];
        
        
        
    }
    
    if ([[dict objectForKey:@"Top"]isEqualToString:@"Persian"]) {
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToShamsiMode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToShamsiMode  attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.05 constant:0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToShamsiMode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX  multiplier:1 constant:0.0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToShamsiMode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeCenterY  multiplier:0.295 constant:0.0]];
        
        
        
    }
    
    
    // Left Position
    if ([[dict objectForKey:@"Left"] isEqualToString:@"English"]) {
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToMiladiMode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToMiladiMode  attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.05 constant:0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToMiladiMode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX  multiplier:0.45 constant:0.0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToMiladiMode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeCenterY  multiplier:0.4 constant:0.0]];
        
        
    }
    if ([[dict objectForKey:@"Left"] isEqualToString:@"Arabic"]) {
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToHijriMode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToHijriMode  attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.05 constant:0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToHijriMode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX  multiplier:0.45 constant:0.0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToHijriMode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeCenterY  multiplier:0.4 constant:0.0]];
        
    }
    if ([[dict objectForKey:@"Left"] isEqualToString:@"Persian"]) {
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToShamsiMode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToShamsiMode  attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.05 constant:0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToShamsiMode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX  multiplier:0.45 constant:0.0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToShamsiMode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeCenterY  multiplier:0.4 constant:0.0]];
        
        
        
        
    }
    
    if ([[dict objectForKey:@"Right"] isEqualToString:@"English"]) {
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToMiladiMode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToMiladiMode  attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.05 constant:0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToMiladiMode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX  multiplier:1.55 constant:0.0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToMiladiMode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeCenterY  multiplier:0.4 constant:0.0]];
        
        
    }
    
    if ([[dict objectForKey:@"Right"] isEqualToString:@"Arabic"]) {
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToHijriMode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToHijriMode  attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.05 constant:0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToHijriMode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX  multiplier:1.55 constant:0.0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToHijriMode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeCenterY  multiplier:0.4 constant:0.0]];
        
        
    }
    
    if ([[dict objectForKey:@"Right"] isEqualToString:@"Persian"]) {
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToShamsiMode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToShamsiMode  attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.05 constant:0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToShamsiMode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX  multiplier:1.55 constant:0.0]];
        
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.btnChangeToShamsiMode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeCenterY  multiplier:0.4 constant:0.0]];
        
    }
    
       
    
    
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.lblBackgroundClendar attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.97 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.lblBackgroundClendar  attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.59 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.lblBackgroundClendar attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX  multiplier:1 constant:0.0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.lblBackgroundClendar attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeCenterY  multiplier:0.725 constant:0.0]];
    
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.925 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.collectionView  attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.425 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX  multiplier:1 constant:0.0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeCenterY  multiplier:0.87 constant:0.0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.lblBackgroundEvents attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.97 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.lblBackgroundEvents  attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.325 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.lblBackgroundEvents attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX  multiplier:1 constant:0.0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.lblBackgroundEvents attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeCenterY  multiplier:1.665 constant:0.0]];
    
    
   
    
    
    [self setCustomColor];
   
    
    
    
    
    
  
    
    
}
-(void)setUserCalendarMode{
    AppDelegate *myApp=[UIApplication sharedApplication].delegate;
    NSString *plistInfo=[[myApp documentsPath] stringByAppendingString:@"/MySetting.plist"];
    NSMutableDictionary *myDict=[[NSMutableDictionary alloc]initWithContentsOfFile:plistInfo];
    _calendarMode=[myDict objectForKey:@"Default"];
    
}

-(void)setCustomColor{
    
    _collectionView.backgroundColor=[self colorWithHexString:@"619CB5"];
    
    _btnChangeToHijriMode.tintColor=[self colorWithHexString:@"4C4C4C"];
    _btnChangeToMiladiMode.tintColor=[self colorWithHexString:@"4C4C4C"];
    _btnChangeToShamsiMode.tintColor=[self colorWithHexString:@"4C4C4C"];
    
    _lblCustomNav.backgroundColor=[self colorWithHexString:@"2C3E50"];
    
}


@end
