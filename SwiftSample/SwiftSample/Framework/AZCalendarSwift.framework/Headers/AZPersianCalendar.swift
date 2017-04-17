//
//  AZPersianCalendar.swift
//  AZCalendarSwift
//
//  Created by Ali on 4/11/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

import Foundation
public class AZPersianCalendar {
    
    
    
  public  static func getPersianDayNumber()->Int{
        
        return AZPersianCalendar.getPersianDate().day
    }
  public  static func getPersianMonthNumber()->Int{
        return AZPersianCalendar.getPersianDate().month
    }
   public static func getPersianYearNumber()->Int{
        return AZPersianCalendar.getPersianDate().year
    }
    
    
    private static func getPersianDate() -> (day : Int , month : Int , year : Int) {
        
        let gregorianCalendar = Calendar.init(identifier: .gregorian)
        let gregorianComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date.init(timeIntervalSinceNow: 0))
        let date = gregorianCalendar.date(from: gregorianComponents)
        let persianCalendar = Calendar.init(identifier: .persian)
        let persianComponents = persianCalendar.dateComponents([.year, .month, .day], from: date!)
        return (day : persianComponents.day! , month : persianComponents.month! , year : persianComponents.year!)
          }
    
}
