//
//  DayType.swift
//  AZCalendar
//
//  Created by Ali on 10/7/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

import Foundation
enum DayType : Int {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    
    
    init(dayString input : String){
        var result = 0
        switch input {
        case "Sun":
            result = 0
            break
        case "Mon":
            result = 1
            break
        case "Tue":
            result = 2
            break
        case "Wed":
            result = 3
            break
        case "Thu":
            result = 4
            break
        case "Fri":
            result = 5
            break
        case "Sat":
            result = 6
            break
        default:
            break
        }
        self = DayType(rawValue: result)!
    }
}


