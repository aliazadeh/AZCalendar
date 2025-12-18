//
//  AZPersianMonthType.swift
//  AZCalendar
//
//  Created by Ali on 10/6/17.
//  Copyright © 2017-2024 Ali Azadeh. All rights reserved.
//

import Foundation

/// Represents the months in the Persian (Solar Hijri) calendar
public enum AZPersianMonthType: Int, CaseIterable, CustomStringConvertible, Sendable {
    case farvardin = 1
    case ordibehesht = 2
    case khordad = 3
    case tir = 4
    case mordad = 5
    case shahrivar = 6
    case mehr = 7
    case aban = 8
    case azar = 9
    case dey = 10
    case bahman = 11
    case esfand = 12
    
    public var description: String {
        switch self {
        case .farvardin:
            return "Farvardin"
        case .ordibehesht:
            return "Ordibehesht"
        case .khordad:
            return "Khordad"
        case .tir:
            return "Tir"
        case .mordad:
            return "Mordad"
        case .shahrivar:
            return "Shahrivar"
        case .mehr:
            return "Mehr"
        case .aban:
            return "Aban"
        case .azar:
            return "Azar"
        case .dey:
            return "Dey"
        case .bahman:
            return "Bahman"
        case .esfand:
            return "Esfand"
        }
    }
    
    /// Number of days in this month (for non-leap years)
    public var daysInMonth: Int {
        switch self {
        case .farvardin, .ordibehesht, .khordad, .tir, .mordad, .shahrivar:
            return 31
        case .mehr, .aban, .azar, .dey, .bahman:
            return 30
        case .esfand:
            return 29
        }
    }
}

