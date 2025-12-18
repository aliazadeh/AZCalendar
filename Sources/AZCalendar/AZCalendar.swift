//
//  AZCalendar.swift
//  AZCalendar
//
//  Created by Ali on 4/11/17.
//  Copyright © 2017-2024 Ali Azadeh. All rights reserved.
//

import Foundation

/// Main interface for AZCalendar - provides calendar date operations
/// for Gregorian, Persian, and Hijri calendars
public final class AZCalendar {
    
    // MARK: - Current Date Methods
    
    /// Returns the current date in the Gregorian calendar
    public static func getCurrentGregorianDate() -> DateType {
        return DateType(
            day: AZGregorianCalendar.getGregorianDayNumber(),
            month: AZGregorianCalendar.getGregorianMonthNumber(),
            year: AZGregorianCalendar.getGregorianYearNumber()
        )
    }
    
    /// Returns the current date in the Persian (Solar Hijri) calendar
    public static func getCurrentPersianDate() -> DateType {
        return DateType(
            day: AZPersianCalendar.getPersianDayNumber(),
            month: AZPersianCalendar.getPersianMonthNumber(),
            year: AZPersianCalendar.getPersianYearNumber()
        )
    }
    
    /// Returns the current date in the Hijri (Islamic) calendar
    public static func getCurrentHijriDate() -> DateType {
        return DateType(
            day: AZHijriCalendar.getHijriDayNumber(),
            month: AZHijriCalendar.getHijriMonthNumber(),
            year: AZHijriCalendar.getHijriYearNumber()
        )
    }
    
    // MARK: - Date Conversion
    
    /// Converts a date from one calendar system to another
    /// - Parameters:
    ///   - inputType: The source calendar type
    ///   - inputDate: The date to convert
    ///   - outputType: The target calendar type
    /// - Returns: The converted date
    public static func convertDate(
        inputType: CalendarType,
        inputDate: DateType,
        outputType: CalendarType
    ) -> DateType {
        return AZConvertorCalendar.convertDate(
            inputType: inputType,
            inputDate: inputDate,
            outputType: outputType
        )
    }
    
    // MARK: - Day Information
    
    /// Returns the day of week index for a given date
    /// - Parameters:
    ///   - date: The date to check
    ///   - calendar: The calendar type of the input date
    /// - Returns: Day index (0 = Sunday, 1 = Monday, ..., 6 = Saturday)
    public static func getDayIndex(date: DateType, calendar: CalendarType) -> Int {
        let cal = Calendar(identifier: calendar.calendarIdentifier)
        
        var components = DateComponents()
        components.day = date.day
        components.month = date.month
        components.year = date.year
        
        guard let targetDate = cal.date(from: components) else {
            return 0
        }
        
        let weekday = cal.component(.weekday, from: targetDate)
        // Convert from Calendar's 1-7 (Sunday-Saturday) to 0-6
        return weekday - 1
    }
    
    /// Returns the short name of the day of week for a given date
    /// - Parameters:
    ///   - calendar: The calendar type of the input date
    ///   - date: The date to check
    /// - Returns: Short day name (e.g., "Sun", "Mon")
    public static func getDayName(calendar: CalendarType, date: DateType) -> String {
        let cal = Calendar(identifier: calendar.calendarIdentifier)
        
        var components = DateComponents()
        components.day = date.day
        components.month = date.month
        components.year = date.year
        
        guard let targetDate = cal.date(from: components) else {
            return "---"
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: targetDate)
    }
    
    /// Returns the full name of the day of week for a given date
    /// - Parameters:
    ///   - calendar: The calendar type of the input date
    ///   - date: The date to check
    /// - Returns: Full day name (e.g., "Sunday", "Monday")
    public static func getFullDayName(calendar: CalendarType, date: DateType) -> String {
        let dayIndex = getDayIndex(date: date, calendar: calendar)
        return DayType(rawValue: dayIndex)?.description ?? "---"
    }
    
    // MARK: - Month Information
    
    /// Returns the name of the month for a given date
    /// - Parameters:
    ///   - calendar: The calendar type
    ///   - date: The date containing the month
    /// - Returns: Month name
    public static func getMonthName(calendar: CalendarType, date: DateType) -> String {
        return AZMonthManager.getMonthName(calendar: calendar, monthNumber: date.month)
    }
}

