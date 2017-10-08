//
//  AZConvertorCalendar.swift
//  AZCalendarSwift
//
//  Created by Ali on 4/11/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

import Foundation

public enum CalendarType {
    case persian
    case hijri
    case gregorian
}

public class AZConvertorCalendar {
    
    static func convertDate(inputType : CalendarType , inputDate : DateType , outputType : CalendarType)->DateType {
        
        var input = Calendar.Identifier.persian
        var output = Calendar.Identifier.persian
        
        let result = DateType.init(day: 0, month: 0, year: 0)
        
        switch inputType {
        case .persian:
            input = .persian
            break
        case .gregorian :
            input = .gregorian
            break
        case .hijri :
            input = .islamicCivil
            break
        }
        
        switch outputType {
        case .persian:
            output = .persian
            break
        case .gregorian :
            output = .gregorian
            break
        case .hijri :
            output = .islamicCivil
            break
        }
        
        let sourceCal = Calendar.init(identifier: input)
        
        var sourceComponent = DateComponents.init()
        
        sourceComponent.day = inputDate.day
        sourceComponent.month = inputDate.month
        sourceComponent.year = inputDate.year
        
        let sourceDate = sourceCal.date(from: sourceComponent)
        let destinationCal = Calendar.init(identifier: output)
        let destinationComponents = destinationCal.dateComponents([.year, .month, .day], from: sourceDate!)
        result.day = destinationComponents.day!
        result.month = destinationComponents.month!
        result.year = destinationComponents.year!
        
        return result
    }
    
}
