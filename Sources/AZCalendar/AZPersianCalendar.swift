//
//  AZPersianCalendar.swift
//  AZCalendar
//
//  Created by Ali on 4/11/17.
//  Copyright © 2017-2024 Ali Azadeh. All rights reserved.
//

import Foundation

/// Provides current date information for the Persian (Solar Hijri) calendar
public final class AZPersianCalendar {
    
    private static let calendar = Calendar(identifier: .persian)
    
    /// Returns the current day in the Persian calendar (1-31)
    public static func getPersianDayNumber() -> Int {
        return getPersianDate().day
    }
    
    /// Returns the current month in the Persian calendar (1-12)
    public static func getPersianMonthNumber() -> Int {
        return getPersianDate().month
    }
    
    /// Returns the current year in the Persian calendar
    public static func getPersianYearNumber() -> Int {
        return getPersianDate().year
    }
    
    /// Returns the current date components as a tuple
    public static func getPersianDate() -> (day: Int, month: Int, year: Int) {
        let components = calendar.dateComponents([.year, .month, .day], from: Date())
        return (
            day: components.day ?? 1,
            month: components.month ?? 1,
            year: components.year ?? 1403
        )
    }
}

