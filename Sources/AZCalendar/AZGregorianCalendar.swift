//
//  AZGregorianCalendar.swift
//  AZCalendar
//
//  Created by Ali on 4/11/17.
//  Copyright © 2017-2024 Ali Azadeh. All rights reserved.
//

import Foundation

/// Provides current date information for the Gregorian calendar
public final class AZGregorianCalendar {
    
    private static let calendar = Calendar(identifier: .gregorian)
    
    /// Returns the current year in the Gregorian calendar
    public static func getGregorianYearNumber() -> Int {
        return calendar.component(.year, from: Date())
    }
    
    /// Returns the current month in the Gregorian calendar (1-12)
    public static func getGregorianMonthNumber() -> Int {
        return calendar.component(.month, from: Date())
    }
    
    /// Returns the current day in the Gregorian calendar (1-31)
    public static func getGregorianDayNumber() -> Int {
        return calendar.component(.day, from: Date())
    }
    
    /// Returns the current date components as a tuple
    public static func getGregorianDate() -> (day: Int, month: Int, year: Int) {
        let components = calendar.dateComponents([.year, .month, .day], from: Date())
        return (
            day: components.day ?? 1,
            month: components.month ?? 1,
            year: components.year ?? 2024
        )
    }
}

