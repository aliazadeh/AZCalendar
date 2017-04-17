# AZPersianCalendar
AZPersianCalendar is a  library for IOS it has georgian calendar , persian calendar hijri calendar (islamic calendar) , and you can convert dates from each calendar to each other simply 

![alt tag](http://aliazadeh.me/AZPersianCal/img5.png)




# Installation : 

Simply use the Frame work that it is in the framework directory for ObjectiveC projects or Swift and ## don’t forget to add the general->Embedded Binaries

# Usage : 

for Using AZCalendar Youd Don't need instance Object of this Class you can call function with class name 'AZCalendar

<div align="center">
 <img src="http://aliazadeh.me/AZPersianCal/img1.png" width="300" height = "auto" margin = "auto" />
</div>

## Geting today's date  :

for getting today info you can use AZCalendar.getCurrentPersianDate() , AZCalendar.getCurrentHijriDate() and AZCalendar.getCurrentGregorianDate() that returns a DateType instance that has day and month and year as Int 

if you want to know the month name in each calendar type use AZCalendar.getMonthName that wants a DateType Object and your Clander type , CalendarType is enum that has 3 value persian , gregorian and hijri

if you want know the day of week you can use AZCalendar.getDayIndex that return the Int 0 means to day is Sunday , 1 means today is Monday and …


## Converting dates : 

for converting date to each others you can use the AZCalendar.convertDate that it wants a instance of DateType and the origin and destination calendarType and returns a DateType Obkect
###Example :

 let source = DateType.init(day: 5, month: 8, year: 1395)
        let gregorian = AZCalendar.convertDate(inputType: .persian, inputDate: source, outputType: .gregorian)


now the gregorian object hasr 3 field that day is = 26 , month = 10 and year is 2016 




