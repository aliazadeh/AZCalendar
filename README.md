# AZPersianCalendar
AZPersianCalendar is a  Calendar that Supports Georgian Calendar , Persian Calendar and Islamic Clanedar 
you Can Also Converting date from on Calendar Source to Other Calendar Types you can use With Boath ObjecticeC and Swift

#The contract :
these 3 key Word is very Important : 

 <b>Shamsi</b> : meanse Persian Calenar (Hijri Shamsi , Khayam's Calendar and ...) <br>
  <b>Hijri</b> : meanse Hijri Ghamari Calendar , Islamic Calendar and ...<br>
<b> Miladi</b> : miladi Meanse Georgian Calendar

# Installation : 

A.  Objective C : 
import ConvertorViewController.h and ConvertorViewController.m to Your Project


B.  Swift : 
imort ConvertorViewController.h and ConvertorViewController.m to Your Project and inBridging-Header file  write #import"ConvertorViewController.h"


# Usage : 

for Using AZPersianCalendar Youd Don't Need instanse Object of this Class you Can call Function with calss name 'AZPersianCalendar'

## Geting today's date  :
### Objective C :
[AZPersianCalendar getShamsiMonthNumber] , for Complete Date you shoud geShamsiDayNumber and getShamsiYearNumber , if you want to get Islamic Date use : [AZPersianCaledar getHijriDayNumber] and hijriMonthNumber and hijriYearNumber

### Swift -:
for  getting today Date in Persian Mode :   AZPersianCalendar.getShamsiMonthNumber()  ,  AZPersianCalendar.getShamsiDayNumber() and AZPersianCalendar.getShamsiYearNumber() 

for Islamic Date : AZPersianCalendar.getHijriDayNumber() , AZPersianCalendar.getHijriMonthNumber() and AZPersianCalendar.getHijriYearNumber()


## Converting dates : 

for Converting Date to each others you should use this format Of String :

### 'Day-Month-Year'

for converting use convert...DateTo...Date () as an input you shoud use String with format of "day-month-year" and you get Out put whit this format again 

###Example :
if you use AZPersianCalendar.ConvertShamsiDateToMiladiDate("17-3-1371") you see "7-6-1992" as Result




