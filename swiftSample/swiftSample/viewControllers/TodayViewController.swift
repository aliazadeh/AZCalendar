//
//  TodayViewController.swift
//  swiftSample
//
//  Created by Ali on 10/26/16.
//  Copyright © 2016 Ali Azadeh. All rights reserved.
//

import Foundation
import UIKit
class TodayViewController: UIViewController {
   
    @IBOutlet weak var segCtrCalendarType: UISegmentedControl!
    
    @IBOutlet weak var lblDay: UILabel!
    
    
    @IBOutlet weak var lblMonth: UILabel!
    
    @IBOutlet weak var lblYear: UILabel!
    
    
    @IBOutlet weak var lblMonthName: UILabel!
    
    @IBOutlet weak var lblDayOfWeek: UILabel!
    
    @IBAction func changedCalendarMode(_ sender: UISegmentedControl) {
        
        self.setDate()
        self.setDayOfWeekAndMonth()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDate()
        self.setDayOfWeekAndMonth()
    }
    
    private func setDate (){
    
    let todayGregorian = AZPersianCalendar.getMiladiDate()
    let todayPersian = AZPersianCalendar.getShamsiDate()
    let todayHijri = AZPersianCalendar.getHijriDate()
        
      
        switch (segCtrCalendarType.selectedSegmentIndex) {
        case 0:
            // Georgian
            
            
            lblDay.text = "\(todayGregorian!.day)"
            lblMonth.text = "\(todayGregorian!.month)"
            lblYear.text = "\(todayGregorian!.year)"
            
            break;
            
        case 1 :
            // Persian
            
            lblDay.text = "\(todayPersian!.day)"
            lblMonth.text = "\(todayPersian!.month)"
            lblYear.text = "\(todayPersian!.year)"
            
           
            break;
            
        case 2:
            // Hijri or Islamic
            
            lblDay.text = "\(todayHijri!.day)"
            lblMonth.text = "\(todayHijri!.month)"
            lblYear.text = "\(todayHijri!.year)"

            
           
            break;
            
        default :
            break
            
        }

        
        
    
    
    }
    
    private func setDayOfWeekAndMonth(){
    
        lblDayOfWeek.text = AZPersianCalendar.getCurrentDay()
        switch (segCtrCalendarType.selectedSegmentIndex) {
        case 0:
            lblMonthName.text = AZPersianCalendar.getMonthName(withCalendarMode: georgian)
            break;
            
        case 1:
            lblMonthName.text = AZPersianCalendar.getMonthName(withCalendarMode: persian)
            break;
            
        case 2:
            lblMonthName.text = AZPersianCalendar.getMonthName(withCalendarMode: hijri)
            break;
            
        default :
            break
            
        }
        
        
    }
    
    
    
}
