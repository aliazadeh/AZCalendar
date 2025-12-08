//
//  AZMonthManager.swift
//  AZCalendar
//
//  Created by Ali on 4/13/17.
//  Copyright © 2017-2024 Ali Azadeh. All rights reserved.
//

import Foundation

/// Manages month information for different calendar types
public final class AZMonthManager {
    
    /// Returns the name of a month for a given calendar type
    /// - Parameters:
    ///   - calendar: The calendar type
    ///   - monthNumber: The month number (1-12)
    /// - Returns: The month name, or "Invalid" if month number is out of range
    public static func getMonthName(calendar: CalendarType, monthNumber: Int) -> String {
        switch calendar {
        case .persian:
            return AZPersianMonthType(rawValue: monthNumber)?.description ?? "Invalid"
        case .gregorian:
            return AZGregorianMonthType(rawValue: monthNumber)?.description ?? "Invalid"
        case .hijri:
            return AZHijriMonthType(rawValue: monthNumber)?.description ?? "Invalid"
        }
    }
    
    /// Returns the Persian month type for a given month number
    /// - Parameter monthNumber: The month number (1-12)
    /// - Returns: The month type, or nil if invalid
    public static func getPersianMonthInfo(monthNumber: Int) -> AZPersianMonthType? {
        return AZPersianMonthType(rawValue: monthNumber)
    }
    
    /// Returns the Gregorian month type for a given month number
    /// - Parameter monthNumber: The month number (1-12)
    /// - Returns: The month type, or nil if invalid
    public static func getGregorianMonthInfo(monthNumber: Int) -> AZGregorianMonthType? {
        return AZGregorianMonthType(rawValue: monthNumber)
    }
    
    /// Returns the Hijri month type for a given month number
    /// - Parameter monthNumber: The month number (1-12)
    /// - Returns: The month type, or nil if invalid
    public static func getHijriMonthInfo(monthNumber: Int) -> AZHijriMonthType? {
        return AZHijriMonthType(rawValue: monthNumber)
    }
    
    /// Returns all month names for a given calendar type
    /// - Parameter calendar: The calendar type
    /// - Returns: Array of month names in order
    public static func getAllMonthNames(for calendar: CalendarType) -> [String] {
        switch calendar {
        case .persian:
            return AZPersianMonthType.allCases.map { $0.description }
        case .gregorian:
            return AZGregorianMonthType.allCases.map { $0.description }
        case .hijri:
            return AZHijriMonthType.allCases.map { $0.description }
        }
    }
}

