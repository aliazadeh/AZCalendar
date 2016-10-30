# AZPersianCalendar
AZPersianCalendar is a  library for IOS it has georgian calendar , persian calendar hijri calendar (islamic calendar) , and you can convert dates from each calendar to each other simply 
#The contract :
these 3 key Word is very Important : 

 <b>Shamsi</b> : meanse Persian Calenar (Hijri Shamsi , Khayam's Calendar and ...) <br>
  <b>Hijri</b> : meanse Hijri Ghamari Calendar , Islamic Calendar and ...<br>
<b> Miladi</b> : miladi Meanse Georgian Calendar



![alt tag](http://aliazadeh.me/AZPersianCal/img5.png)




# Installation : 

A.  Objective C : 
import ConvertorViewController.h and ConvertorViewController.m to Your Project


B.  Swift : 
imort ConvertorViewController.h and ConvertorViewController.m to Your Project and inBridging-Header file  write #import"ConvertorViewController.h"


# Usage : 

for Using AZPersianCalendar Youd Don't Need instanse Object of this Class you Can call Function with calss name 'AZPersianCalendar'




 <img src="http://aliazadeh.me/AZPersianCal/img1.png" width="350" height = "auto" />

## Geting today's date  :
### Objective C :
[AZPersianCalendar getShamsiMonthNumber] , for Complete Date you shoud geShamsiDayNumber and getShamsiYearNumber , if you want to get Islamic Date use : [AZPersianCaledar getHijriDayNumber] and hijriMonthNumber and hijriYearNumber

### Swift -:
for  getting today Date in Persian Mode :   AZPersianCalendar.getShamsiMonthNumber()  ,  AZPersianCalendar.getShamsiDayNumber() and AZPersianCalendar.getShamsiYearNumber() 

for Islamic Date : AZPersianCalendar.getHijriDayNumber() , AZPersianCalendar.getHijriMonthNumber() and AZPersianCalendar.getHijriYearNumber()


## Converting dates : 

for converting date to each others you should use instance of CalendarType :
###Example :
CalendarType * myDtate = [[CalendarType alloc]init];
mydate.day = 5 ;
mydaye.month = 8 ;
mydate.year = 1395;

CalendarType * destination = [AzPersianCalendar ConvertShamsiDateToMiladiDate: mydate];

now if you print destination.description you can see that destination is a georgian date that the day is eqaul 26 , the month is equal 10 and the year is equal 2016




