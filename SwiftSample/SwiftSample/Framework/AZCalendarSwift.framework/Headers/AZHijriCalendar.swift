//
//  AZHijriCalendar.swift
//  AZCalendarSwift
//
//  Created by Ali on 4/11/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

import Foundation
 public class AZHijriCalendar {
    
    
    static func getHijriDayNumber()->Int{
        
        return AZHijriCalendar.getHijriDate().day
    }
    static func getHijriMonthNumber()->Int{
        return AZHijriCalendar.getHijriDate().month
    }
    static func getHijriYearNumber()->Int{
        return AZHijriCalendar.getHijriDate().year
    }
    
    
   private static func getHijriDate() -> (day : Int , month : Int , year : Int) {
    
    
        let gregorianCalendar = Calendar.init(identifier: .gregorian)
        let gregorianComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date.init(timeIntervalSinceNow: 0))
        
        
        let date = gregorianCalendar.date(from: gregorianComponents)
       
        
        let hijriCalendar = Calendar.init(identifier: .islamicCivil)
        let hijriComponents = hijriCalendar.dateComponents([.year, .month, .day], from: date!)
     
        return (day : hijriComponents.day! , month : hijriComponents.month! , year : hijriComponents.year!)
    
    }
    
}
