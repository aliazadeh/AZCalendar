//
//  AZCalendarTests.swift
//  AZCalendarTests
//
//  Copyright © 2024 Ali Azadeh. All rights reserved.
//

import XCTest
@testable import AZCalendar

final class AZCalendarTests: XCTestCase {
    
    // MARK: - Date Conversion Tests
    
    func testGregorianToPersianConversion() {
        // October 26, 2016 = Aban 5, 1395
        let gregorianDate = DateType(day: 26, month: 10, year: 2016)
        let persianDate = AZCalendar.convertDate(
            inputType: .gregorian,
            inputDate: gregorianDate,
            outputType: .persian
        )
        
        XCTAssertEqual(persianDate.day, 5)
        XCTAssertEqual(persianDate.month, 8)
        XCTAssertEqual(persianDate.year, 1395)
    }
    
    func testPersianToGregorianConversion() {
        // Aban 5, 1395 = October 26, 2016
        let persianDate = DateType(day: 5, month: 8, year: 1395)
        let gregorianDate = AZCalendar.convertDate(
            inputType: .persian,
            inputDate: persianDate,
            outputType: .gregorian
        )
        
        XCTAssertEqual(gregorianDate.day, 26)
        XCTAssertEqual(gregorianDate.month, 10)
        XCTAssertEqual(gregorianDate.year, 2016)
    }
    
    func testGregorianToHijriConversion() {
        // December 8, 2024 in Hijri
        let gregorianDate = DateType(day: 8, month: 12, year: 2024)
        let hijriDate = AZCalendar.convertDate(
            inputType: .gregorian,
            inputDate: gregorianDate,
            outputType: .hijri
        )
        
        XCTAssertTrue(hijriDate.year > 1445)
        XCTAssertTrue(hijriDate.month >= 1 && hijriDate.month <= 12)
        XCTAssertTrue(hijriDate.day >= 1 && hijriDate.day <= 30)
    }
    
    func testSameCalendarConversion() {
        let date = DateType(day: 15, month: 6, year: 2024)
        let convertedDate = AZCalendar.convertDate(
            inputType: .gregorian,
            inputDate: date,
            outputType: .gregorian
        )
        
        XCTAssertEqual(date.day, convertedDate.day)
        XCTAssertEqual(date.month, convertedDate.month)
        XCTAssertEqual(date.year, convertedDate.year)
    }
    
    // MARK: - Current Date Tests
    
    func testGetCurrentGregorianDate() {
        let date = AZCalendar.getCurrentGregorianDate()
        
        XCTAssertTrue(date.day >= 1 && date.day <= 31)
        XCTAssertTrue(date.month >= 1 && date.month <= 12)
        XCTAssertTrue(date.year >= 2024)
    }
    
    func testGetCurrentPersianDate() {
        let date = AZCalendar.getCurrentPersianDate()
        
        XCTAssertTrue(date.day >= 1 && date.day <= 31)
        XCTAssertTrue(date.month >= 1 && date.month <= 12)
        XCTAssertTrue(date.year >= 1403)
    }
    
    func testGetCurrentHijriDate() {
        let date = AZCalendar.getCurrentHijriDate()
        
        XCTAssertTrue(date.day >= 1 && date.day <= 30)
        XCTAssertTrue(date.month >= 1 && date.month <= 12)
        XCTAssertTrue(date.year >= 1446)
    }
    
    // MARK: - Month Name Tests
    
    func testGregorianMonthNames() {
        let months = AZMonthManager.getAllMonthNames(for: .gregorian)
        
        XCTAssertEqual(months.count, 12)
        XCTAssertEqual(months[0], "January")
        XCTAssertEqual(months[11], "December")
    }
    
    func testPersianMonthNames() {
        let months = AZMonthManager.getAllMonthNames(for: .persian)
        
        XCTAssertEqual(months.count, 12)
        XCTAssertEqual(months[0], "Farvardin")
        XCTAssertEqual(months[11], "Esfand")
    }
    
    func testHijriMonthNames() {
        let months = AZMonthManager.getAllMonthNames(for: .hijri)
        
        XCTAssertEqual(months.count, 12)
        XCTAssertEqual(months[0], "Muharram")
        XCTAssertEqual(months[8], "Ramadan")
    }
    
    func testInvalidMonthNumber() {
        let name = AZMonthManager.getMonthName(calendar: .gregorian, monthNumber: 13)
        XCTAssertEqual(name, "Invalid")
        
        let zeroMonth = AZMonthManager.getMonthName(calendar: .persian, monthNumber: 0)
        XCTAssertEqual(zeroMonth, "Invalid")
    }
    
    // MARK: - Day Type Tests
    
    func testDayTypeFromString() {
        XCTAssertEqual(DayType(dayString: "Sun").rawValue, 0)
        XCTAssertEqual(DayType(dayString: "Mon").rawValue, 1)
        XCTAssertEqual(DayType(dayString: "Sat").rawValue, 6)
        XCTAssertEqual(DayType(dayString: "Invalid").rawValue, 0) // Defaults to Sunday
    }
    
    func testDayTypeDescription() {
        XCTAssertEqual(DayType.sunday.description, "Sunday")
        XCTAssertEqual(DayType.friday.description, "Friday")
    }
    
    func testDayTypeShortName() {
        XCTAssertEqual(DayType.sunday.shortName, "Sun")
        XCTAssertEqual(DayType.wednesday.shortName, "Wed")
    }
    
    // MARK: - DateType Tests
    
    func testDateTypeEquality() {
        let date1 = DateType(day: 1, month: 1, year: 2024)
        let date2 = DateType(day: 1, month: 1, year: 2024)
        let date3 = DateType(day: 2, month: 1, year: 2024)
        
        XCTAssertEqual(date1, date2)
        XCTAssertNotEqual(date1, date3)
    }
    
    func testDateTypeDescription() {
        let date = DateType(day: 15, month: 6, year: 2024)
        XCTAssertEqual(date.description, "15/6/2024")
    }
    
    func testDateTypeIsoFormat() {
        let date = DateType(day: 5, month: 3, year: 2024)
        XCTAssertEqual(date.isoFormat, "2024/03/05")
    }
    
    func testDateTypeValidation() {
        let validDate = DateType(day: 15, month: 6, year: 2024)
        let invalidDay = DateType(day: 32, month: 6, year: 2024)
        let invalidMonth = DateType(day: 15, month: 13, year: 2024)
        let invalidYear = DateType(day: 15, month: 6, year: 0)
        
        XCTAssertTrue(validDate.isValid)
        XCTAssertFalse(invalidDay.isValid)
        XCTAssertFalse(invalidMonth.isValid)
        XCTAssertFalse(invalidYear.isValid)
    }
    
    func testDateTypeZero() {
        let zeroDate = DateType.zero
        
        XCTAssertEqual(zeroDate.day, 0)
        XCTAssertEqual(zeroDate.month, 0)
        XCTAssertEqual(zeroDate.year, 0)
    }
    
    // MARK: - Calendar Type Tests
    
    func testCalendarTypeIdentifiers() {
        XCTAssertEqual(CalendarType.gregorian.calendarIdentifier, .gregorian)
        XCTAssertEqual(CalendarType.persian.calendarIdentifier, .persian)
        XCTAssertEqual(CalendarType.hijri.calendarIdentifier, .islamicCivil)
    }
    
    func testCalendarTypeDisplayNames() {
        XCTAssertEqual(CalendarType.gregorian.displayName, "Gregorian")
        XCTAssertTrue(CalendarType.persian.displayName.contains("Persian"))
        XCTAssertTrue(CalendarType.hijri.displayName.contains("Hijri"))
    }
}

