//
//  AZCalendar.swift
//  AZCalendarSwift
//
//  Created by Ali on 4/11/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

import Foundation
public class AZCalendar {
    
    
   public static func getCurrentGregorianDate() -> DateType{
        
        let miladiDay = AZGregorianCalendar.getGregorianDayNumber()
        let miladiMonth = AZGregorianCalendar.getGregorianMonthNumber()
        let miladiYear = AZGregorianCalendar.getGregorianYearNumber()
        
        return DateType.init(day: miladiDay, month: miladiMonth, year: miladiYear)
        
    }
   public static func getCurrentPersianDate() -> DateType{
        
        let persianDay = AZPersianCalendar.getPersianDayNumber()
        let persianMonth = AZPersianCalendar.getPersianMonthNumber()
        let persianYear = AZPersianCalendar.getPersianYearNumber()
        
        return DateType.init(day: persianDay, month: persianMonth, year: persianYear)
    }
  public  static func getCurrentHijriDate() -> DateType {
    
    let hijriDay = AZHijriCalendar.getHijriDayNumber()
    let hijriMonth = AZHijriCalendar.getHijriMonthNumber()
    let hijriYear = AZHijriCalendar.getHijriYearNumber()
    
    return DateType.init(day: hijriDay, month: hijriMonth, year: hijriYear)
    
    }
    
    public static func  convertDate(inputType : CalendarType , inputDate : DateType , outputType : CalendarType)->DateType {
    
        let result = AZConvertorCalendar.convertDate(inputType: inputType, inputDate: inputDate, outputType: outputType)
        return result
    }
    
    public static func getDayIndex (date : DateType , calendar : CalendarType) -> Int {
    
        var type = Calendar.Identifier.persian
        switch calendar {
        case .persian:
            type = .persian
            break
        case .gregorian :
            type = .gregorian
            break
        case .hijri :
            type = .islamicCivil
            break
        }
        let myCal = Calendar.init(identifier: type)
        var component = DateComponents.init()
        component.day = date.day
         component.month = date.month
         component.year = date.year
       let formatter = DateFormatter.init()
        formatter.dateFormat = "EEE"
        let myDate = myCal.date(from: component)
      return  DayType(dayString: formatter.string(from: myDate!)).rawValue
    }
    
    public static func getDayName (calendar : CalendarType , date : DateType) -> String {
        var result = "Oops :|"
        var type = Calendar.Identifier.persian
        
        switch calendar {
        case .persian:
            type = .persian
            break
        case .gregorian :
            type = .gregorian
            break
        case .hijri :
            type = .islamicCivil
            break
        }
        
      
        
        let myCal = Calendar.init(identifier: type)
        
        
        var component = DateComponents.init()
        component.day = date.day
        component.month = date.month
        component.year = date.year
        
        let formatter = DateFormatter.init()
        formatter.dateFormat = "EEE"
            let myDate = myCal.date(from: component)
        result = formatter.string(from: myDate!)
        return result
    }
    
    public static func getMonthName (calendar : CalendarType , date : DateType) -> String{
      return AZMonthManager.getMonthName(calendar: calendar, monthNumber: date.month)
        
       }
    
    
}
