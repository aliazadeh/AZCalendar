//
//  AZHijriCalendar.swift
//  AZCalendar
//
//  Created by Ali on 4/11/17.
//  Copyright © 2017-2024 Ali Azadeh. All rights reserved.
//

import Foundation

/// Provides current date information for the Hijri (Islamic) calendar
public final class AZHijriCalendar {
    
    private static let calendar = Calendar(identifier: .islamicCivil)
    
    /// Returns the current day in the Hijri calendar (1-30)
    public static func getHijriDayNumber() -> Int {
        return getHijriDate().day
    }
    
    /// Returns the current month in the Hijri calendar (1-12)
    public static func getHijriMonthNumber() -> Int {
        return getHijriDate().month
    }
    
    /// Returns the current year in the Hijri calendar
    public static func getHijriYearNumber() -> Int {
        return getHijriDate().year
    }
    
    /// Returns the current date components as a tuple
    public static func getHijriDate() -> (day: Int, month: Int, year: Int) {
        let components = calendar.dateComponents([.year, .month, .day], from: Date())
        return (
            day: components.day ?? 1,
            month: components.month ?? 1,
            year: components.year ?? 1446
        )
    }
}

