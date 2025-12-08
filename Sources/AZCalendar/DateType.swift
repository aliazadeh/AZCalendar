//
//  DateType.swift
//  AZCalendar
//
//  Created by Ali on 4/11/17.
//  Copyright © 2017-2024 Ali Azadeh. All rights reserved.
//

import Foundation

/// A simple date representation containing day, month, and year components
public struct DateType: Equatable, Hashable, CustomStringConvertible, Sendable {
    
    public var day: Int
    public var month: Int
    public var year: Int
    
    public init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    /// Returns date in "day/month/year" format
    public var description: String {
        return "\(day)/\(month)/\(year)"
    }
    
    /// Returns date in "year/month/day" format (ISO-like)
    public var isoFormat: String {
        return String(format: "%04d/%02d/%02d", year, month, day)
    }
    
    /// Checks if the date components are within valid ranges
    public var isValid: Bool {
        return day >= 1 && day <= 31 &&
               month >= 1 && month <= 12 &&
               year > 0
    }
    
    /// Creates a zero date (0/0/0) - typically used for error cases
    public static var zero: DateType {
        return DateType(day: 0, month: 0, year: 0)
    }
}

// MARK: - Codable Support
extension DateType: Codable {
    enum CodingKeys: String, CodingKey {
        case day
        case month
        case year
    }
}

