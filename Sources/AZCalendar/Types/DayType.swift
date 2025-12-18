//
//  DayType.swift
//  AZCalendar
//
//  Created by Ali on 10/7/17.
//  Copyright © 2017-2024 Ali Azadeh. All rights reserved.
//

import Foundation

/// Represents days of the week
public enum DayType: Int, CaseIterable, CustomStringConvertible, Sendable {
    case sunday = 0
    case monday = 1
    case tuesday = 2
    case wednesday = 3
    case thursday = 4
    case friday = 5
    case saturday = 6
    
    public var description: String {
        switch self {
        case .sunday:
            return "Sunday"
        case .monday:
            return "Monday"
        case .tuesday:
            return "Tuesday"
        case .wednesday:
            return "Wednesday"
        case .thursday:
            return "Thursday"
        case .friday:
            return "Friday"
        case .saturday:
            return "Saturday"
        }
    }
    
    /// Short name (3 letters)
    public var shortName: String {
        switch self {
        case .sunday:
            return "Sun"
        case .monday:
            return "Mon"
        case .tuesday:
            return "Tue"
        case .wednesday:
            return "Wed"
        case .thursday:
            return "Thu"
        case .friday:
            return "Fri"
        case .saturday:
            return "Sat"
        }
    }
    
    /// Initialize from short day string (e.g., "Sun", "Mon")
    public init(dayString input: String) {
        switch input.prefix(3) {
        case "Sun":
            self = .sunday
        case "Mon":
            self = .monday
        case "Tue":
            self = .tuesday
        case "Wed":
            self = .wednesday
        case "Thu":
            self = .thursday
        case "Fri":
            self = .friday
        case "Sat":
            self = .saturday
        default:
            self = .sunday
        }
    }
}

