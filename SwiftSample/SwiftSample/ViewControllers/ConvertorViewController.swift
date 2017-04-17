//
//  ConvertorViewController.swift
//  swiftSample
//
//  Created by Ali on 10/26/16.
//  Copyright © 2016 Ali Azadeh. All rights reserved.
//

import Foundation
import AZCalendarSwift
import  UIKit



class ConvertorViewController: UIViewController {
    
    @IBOutlet weak var txtOriginDay: UITextField!
    
    @IBOutlet weak var txtOriginMonth: UITextField!
    
    @IBOutlet weak var txtOriginYear: UITextField!
    
    
    @IBOutlet weak var txtDestinationDay: UITextField!
    
    @IBOutlet weak var txtDestinationMonth: UITextField!
    
    
    @IBOutlet weak var txtDestinationYear: UITextField!
    
    
    @IBOutlet weak var segCtrOrigin: UISegmentedControl!
    
    
    @IBOutlet weak var segCtrDestination: UISegmentedControl!
    
    
    @IBAction func segCtrOriginSelected(_ sender: UISegmentedControl) {
        
        
        
        
        switch (segCtrOrigin.selectedSegmentIndex) {
        case 0:
            segCtrDestination.setTitle("Persian", forSegmentAt: 0)
            segCtrDestination.setTitle("Hijri", forSegmentAt: 1)
            break;
            
        case 1:
            
            segCtrDestination.setTitle("Georgian", forSegmentAt: 0)
            segCtrDestination.setTitle("Hijri", forSegmentAt: 1)
            
            break;
            
        case 2:
            
            segCtrDestination.setTitle("Georgian", forSegmentAt: 0)
            segCtrDestination.setTitle("Persian", forSegmentAt: 1)
            
            break;
            
        default:
            break;
        }
        
        
        
        
    }
    
    
    
    @IBAction func btnConvert(_ sender: UIButton) {
        
        
        self.view.endEditing(true)
        
        let originDate = DateType.init(day: Int(txtOriginDay.text!)!  , month: Int(txtOriginMonth.text!)! , year: Int(txtOriginYear.text!)! )
        //
        
        var convertedDate = DateType.init(day: 0, month: 0, year: 0)
        
        let originCalendar = getConvertMode().origin
        let destinationCalendar = getConvertMode().destination
        
        convertedDate = AZCalendar.convertDate(inputType: originCalendar, inputDate: originDate, outputType: destinationCalendar)
        

        
        txtDestinationDay.text = "\(convertedDate.day)"
        txtDestinationMonth.text = "\(convertedDate.month)"
        txtDestinationYear.text = "\(convertedDate.year)"
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    private func getConvertMode() -> (origin : CalendarType , destination : CalendarType) {
        
        var mode : (origin : CalendarType , destination : CalendarType) = (CalendarType.gregorian , CalendarType.persian)
        
        
        switch segCtrOrigin.selectedSegmentIndex {
        case 0:
            if ( segCtrDestination.selectedSegmentIndex == 0 ) { /* Georgian to Persian */
                mode = (origin : CalendarType.gregorian , destination : CalendarType.persian)
            } else {/* Georgian to Hijri */    mode = (origin : CalendarType.gregorian , destination : CalendarType.hijri) }
            break
        case 1:
            
            if ( segCtrDestination.selectedSegmentIndex == 0) { /* Persian to Georgian */
                 mode = (origin : CalendarType.persian , destination : CalendarType.gregorian)
            } else {/* Persian to Hijri */     mode = (origin : CalendarType.persian , destination : CalendarType.hijri) }
            break
            
        case 2:
            
            if ( segCtrDestination.selectedSegmentIndex == 0) { /* Hijri to Georgian */
                 mode = (origin : CalendarType.hijri , destination : CalendarType.gregorian)
            } else {/* Hijri to Persian */    mode = (origin : CalendarType.hijri , destination : CalendarType.persian)
            }
            break
            
        default:
            break
        }
        
        return  mode;
    }
    
}
