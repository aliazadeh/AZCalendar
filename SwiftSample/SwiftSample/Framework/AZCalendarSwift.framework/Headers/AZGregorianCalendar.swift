//
//  AZGregorianCalendar.swift
//  AZCalendarSwift
//
//  Created by Ali on 4/11/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

import Foundation
public class AZGregorianCalendar {
    
    static func getGregorianYearNumber()->Int{
        let yearFormatter = DateFormatter.init()
        yearFormatter.dateFormat = "yyyy"
        let year = yearFormatter.string(from: Date.init(timeIntervalSinceNow: 0))
        return Int.init(year)!
        
    }
    static func getGregorianMonthNumber()->Int{
        
        let monthFormatter = DateFormatter.init()
        monthFormatter.dateFormat = "MM"
        let month = monthFormatter.string(from: Date.init(timeIntervalSinceNow: 0))
        return Int.init(month)!
        
    }
    
    static func getGregorianDayNumber()->Int{
        let dayFormatter = DateFormatter.init()
        dayFormatter.dateFormat = "dd"
        let day = dayFormatter.string(from: Date.init(timeIntervalSinceNow: 0))
        return Int.init(day)!
        
    }
    
}
