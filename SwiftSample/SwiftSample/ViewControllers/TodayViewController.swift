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
        self.setDayOfWeek()
        self.setMonthName()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDate()
        self.setDayOfWeek()
        self.setMonthName()
        }
    
    private func setDate (){
        
        let todayGregorian = AZCalendar.getCurrentGregorianDate()
        let todayPersian = AZCalendar.getCurrentPersianDate()
        let todayHijri = AZCalendar.getCurrentHijriDate()
        
        
        switch (segCtrCalendarType.selectedSegmentIndex) {
        case 0:
            // Georgian
           
            lblDay.text = "\(todayGregorian.day)"
            lblMonth.text = "\(todayGregorian.month)"
            lblYear.text = "\(todayGregorian.year)"
            
            break;
            
        case 1 :
            // Persian
            
            lblDay.text = "\(todayPersian.day)"
            lblMonth.text = "\(todayPersian.month)"
            lblYear.text = "\(todayPersian.year)"
            
            
            break;
            
        case 2:
            // Hijri or Islamic
            
            lblDay.text = "\(todayHijri.day)"
            lblMonth.text = "\(todayHijri.month)"
            lblYear.text = "\(todayHijri.year)"
            
            
            
            break;
            
        default :
            break
            
        }
        
        
        
        
        
    }
    
    private func setDayOfWeek(){
    self.lblDayOfWeek.text = AZCalendar.getDayName(calendar: .gregorian, date: AZCalendar.getCurrentGregorianDate())
    }
    
    private func setMonthName(){
     
       
        
        switch (segCtrCalendarType.selectedSegmentIndex) {
            
        case 0:
            lblMonthName.text = AZCalendar.getMonthName(calendar: .gregorian, date: AZCalendar.getCurrentGregorianDate())
            break
        case 1:
            lblMonthName.text = AZCalendar.getMonthName(calendar: .persian, date: AZCalendar.getCurrentPersianDate())
            break
        case 2:
            lblMonthName.text = AZCalendar.getMonthName(calendar: .hijri, date: AZCalendar.getCurrentHijriDate())

            
            break
        default:
            break
        }
     
        
    }
    
   
    
    
   
    
}
