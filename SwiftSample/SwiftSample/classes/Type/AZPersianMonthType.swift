//
//  PersianMonthType.swift
//  SwiftSample
//
//  Created by Ali on 10/6/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

import Foundation
public enum AZPersianMonthType : Int   {
    
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
    
    var description: String {
        switch self {
        case .farvardin:
            return "farvardin"
        case .ordibehesht:
            return "ordibehesht"
        case .khordad:
            return "khordad"
        case .tir:
            return "tir"
        case .mordad:
            return "mordad"
        case .shahrivar:
            return "shahrivar"
        case .mehr:
            return "mehr"
        case .aban:
            return "aban"
        case .azar:
            return "azar"
        case .dey:
            return "dey"
        case .bahman:
            return "bahman"
        case .esfand:
            return "esfand"
        }
    }
    
    
}
