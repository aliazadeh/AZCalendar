//
//  CalendarType.swift
//  AZCalendar
//
//  Created by Ali on 4/11/17.
//  Copyright © 2017-2024 Ali Azadeh. All rights reserved.
//

import Foundation

/// Supported calendar types for date conversion
public enum CalendarType: String, CaseIterable, Sendable {
    case persian
    case hijri
    case gregorian
    
    /// Returns the corresponding Foundation Calendar.Identifier
    public var calendarIdentifier: Calendar.Identifier {
        switch self {
        case .persian:
            return .persian
        case .gregorian:
            return .gregorian
        case .hijri:
            return .islamicCivil
        }
    }
    
    /// Human-readable name for the calendar type
    public var displayName: String {
        switch self {
        case .persian:
            return "Persian (Solar Hijri)"
        case .gregorian:
            return "Gregorian"
        case .hijri:
            return "Hijri (Islamic)"
        }
    }
}

