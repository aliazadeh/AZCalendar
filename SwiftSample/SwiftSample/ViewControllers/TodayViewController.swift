//
//  TodayViewController.swift
//  SwiftSample
//
//  Created by Ali on 10/26/16.
//  Copyright © 2016-2024 Ali Azadeh. All rights reserved.
//

import UIKit

final class TodayViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var segCtrCalendarType: UISegmentedControl!
    @IBOutlet private weak var lblDay: UILabel!
    @IBOutlet private weak var lblMonth: UILabel!
    @IBOutlet private weak var lblYear: UILabel!
    @IBOutlet private weak var lblMonthName: UILabel!
    @IBOutlet private weak var lblDayOfWeek: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDisplay()
    }
    
    // MARK: - IBActions
    @IBAction private func changedCalendarMode(_ sender: UISegmentedControl) {
        updateDisplay()
    }
    
    // MARK: - Private Methods
    private func updateDisplay() {
        setDate()
        setDayOfWeek()
        setMonthName()
    }
    
    private func setDate() {
        let selectedIndex = segCtrCalendarType.selectedSegmentIndex
        
        let date: DateType
        switch selectedIndex {
        case 0:
            date = AZCalendar.getCurrentGregorianDate()
        case 1:
            date = AZCalendar.getCurrentPersianDate()
        case 2:
            date = AZCalendar.getCurrentHijriDate()
        default:
            date = AZCalendar.getCurrentGregorianDate()
        }
        
        lblDay.text = "\(date.day)"
        lblMonth.text = "\(date.month)"
        lblYear.text = "\(date.year)"
    }
    
    private func setDayOfWeek() {
        let gregorianDate = AZCalendar.getCurrentGregorianDate()
        lblDayOfWeek.text = AZCalendar.getDayName(calendar: .gregorian, date: gregorianDate)
    }
    
    private func setMonthName() {
        let selectedIndex = segCtrCalendarType.selectedSegmentIndex
        
        let monthName: String
        switch selectedIndex {
        case 0:
            monthName = AZCalendar.getMonthName(calendar: .gregorian, date: AZCalendar.getCurrentGregorianDate())
        case 1:
            monthName = AZCalendar.getMonthName(calendar: .persian, date: AZCalendar.getCurrentPersianDate())
        case 2:
            monthName = AZCalendar.getMonthName(calendar: .hijri, date: AZCalendar.getCurrentHijriDate())
        default:
            monthName = ""
        }
        
        lblMonthName.text = monthName
    }
}
