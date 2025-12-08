//
//  AZHijriMonthType.swift
//  AZCalendar
//
//  Created by Ali on 10/6/17.
//  Copyright © 2017-2024 Ali Azadeh. All rights reserved.
//

import Foundation

/// Represents the months in the Hijri (Islamic) calendar
public enum AZHijriMonthType: Int, CaseIterable, CustomStringConvertible, Sendable {
    case muharram = 1
    case safar = 2
    case rabiAlAwwal = 3
    case rabiAlThani = 4
    case jamadiAlAwwal = 5
    case jamadiAlThani = 6
    case rajab = 7
    case shaban = 8
    case ramadan = 9
    case shawwal = 10
    case dhuAlQidah = 11
    case dhuAlHijjah = 12
    
    public var description: String {
        switch self {
        case .muharram:
            return "Muharram"
        case .safar:
            return "Safar"
        case .rabiAlAwwal:
            return "Rabi' al-Awwal"
        case .rabiAlThani:
            return "Rabi' al-Thani"
        case .jamadiAlAwwal:
            return "Jamadi al-Awwal"
        case .jamadiAlThani:
            return "Jamadi al-Thani"
        case .rajab:
            return "Rajab"
        case .shaban:
            return "Sha'ban"
        case .ramadan:
            return "Ramadan"
        case .shawwal:
            return "Shawwal"
        case .dhuAlQidah:
            return "Dhu al-Qi'dah"
        case .dhuAlHijjah:
            return "Dhu al-Hijjah"
        }
    }
    
    /// Number of days in this month (approximate, as Hijri months vary)
    public var daysInMonth: Int {
        switch self {
        case .muharram, .rabiAlAwwal, .jamadiAlAwwal, .rajab, .ramadan, .dhuAlQidah:
            return 30
        case .safar, .rabiAlThani, .jamadiAlThani, .shaban, .shawwal, .dhuAlHijjah:
            return 29
        }
    }
}

