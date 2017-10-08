//
//  GregorianMonthType.swift
//  SwiftSample
//
//  Created by Ali on 10/6/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

import Foundation
public enum AZGregorianMonthType : Int {
    
    case january = 1
    case febuary = 2
    case march = 3
    case april = 4
    case may = 5
    case june = 6
    case july = 7
    case august = 8
    case september = 9
    case october = 10
    case november = 11
    case december = 12
    
    var description: String {
        switch self {
        case .january:
            return "january"
        case .febuary:
            return "febuary"
        case .march:
            return "march"
        case .april:
            return "april"
        case .may:
            return "may"
        case .june:
            return "june"
        case .july:
            return "july"
        case .august:
            return "august"
        case .september:
            return "september"
        case .october:
            return "october"
        case .november:
            return "november"
        case .december:
            return "december"
        }
    }
    
}
