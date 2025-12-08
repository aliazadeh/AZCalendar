//
//  AZConvertorCalendar.swift
//  AZCalendar
//
//  Created by Ali on 4/11/17.
//  Copyright © 2017-2024 Ali Azadeh. All rights reserved.
//

import Foundation

/// Handles date conversion between different calendar systems
public final class AZConvertorCalendar {
    
    /// Converts a date from one calendar system to another
    /// - Parameters:
    ///   - inputType: The source calendar type
    ///   - inputDate: The date to convert
    ///   - outputType: The target calendar type
    /// - Returns: The converted date, or a zero date if conversion fails
    public static func convertDate(
        inputType: CalendarType,
        inputDate: DateType,
        outputType: CalendarType
    ) -> DateType {
        
        let sourceCalendar = Calendar(identifier: inputType.calendarIdentifier)
        let destinationCalendar = Calendar(identifier: outputType.calendarIdentifier)
        
        var sourceComponents = DateComponents()
        sourceComponents.day = inputDate.day
        sourceComponents.month = inputDate.month
        sourceComponents.year = inputDate.year
        
        guard let sourceDate = sourceCalendar.date(from: sourceComponents) else {
            return .zero
        }
        
        let destinationComponents = destinationCalendar.dateComponents(
            [.year, .month, .day],
            from: sourceDate
        )
        
        return DateType(
            day: destinationComponents.day ?? 0,
            month: destinationComponents.month ?? 0,
            year: destinationComponents.year ?? 0
        )
    }
}

