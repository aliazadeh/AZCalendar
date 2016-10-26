//
//  ConvertorViewController.swift
//  swiftSample
//
//  Created by Ali on 10/26/16.
//  Copyright © 2016 Ali Azadeh. All rights reserved.
//

import Foundation
import  UIKit

enum ConvertMode {
    case georgianToPersian
    case georgianToHijri
    case hijriToPersian
    case hijriToGeorgian
    case persianToHijri
    case persianToGeorgian
}

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
        
      let mode = setConvertMode()
        
      let originDate = CalendarType.init(day: Int(txtOriginDay.text!)!  , andMonth: Int(txtOriginMonth.text!)! , andYear: Int(txtOriginYear.text!)! )
//        
        
        var convertedDate = CalendarType.init(day: 0, andMonth: 0, andYear: 0)
        

        
        switch mode {
        case .georgianToPersian:
            convertedDate = AZPersianCalendar.convertMiladiDate(toShamsiDate: originDate!)
            
            break
            
        case .georgianToHijri:
            convertedDate = AZPersianCalendar.convertMiladiDate(toHijriDate: originDate!)
            break
        case .persianToHijri :
            convertedDate = AZPersianCalendar.convertShamsiDate(toHijriDate: originDate!)
            break
            
        case .persianToGeorgian :
            convertedDate = AZPersianCalendar.convertShamsiDate(toMiladiDate: originDate!)
            break
            
        case .hijriToPersian :
            convertedDate = AZPersianCalendar.convertHijriDate(toShamsiDate: originDate!)
            break
            
        case .hijriToGeorgian :
            convertedDate = AZPersianCalendar.convertHijriDate(toMiladiDate: originDate!)
            break
            
       
        }
        
        txtDestinationDay.text = "\(convertedDate!.day)"
        txtDestinationMonth.text = "\(convertedDate!.month)"
        txtDestinationYear.text = "\(convertedDate!.year)"

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    private func setConvertMode() -> ConvertMode {
    
        var mode : ConvertMode = .georgianToHijri
        
        switch segCtrOrigin.selectedSegmentIndex {
        case 0:
            if ( segCtrDestination.selectedSegmentIndex == 0 ) { /* Georgian to Persian */
                            mode = .georgianToPersian ;
                            } else {/* Georgian to Hijri */   mode = .georgianToHijri ;}
            break
        case 1:
            
            if ( segCtrDestination.selectedSegmentIndex == 0) { /* Persian to Georgian */
                            mode = .persianToGeorgian ;
                            } else {/* Persian to Hijri */   mode = .persianToHijri ;}
            break
            
        case 2:
            
            if ( segCtrDestination.selectedSegmentIndex == 0) { /* Hijri to Georgian */
                            mode = .hijriToGeorgian ;
                            } else {/* Hijri to Persian */   mode = .hijriToPersian ;}
            break
            
        default:
            break
        }

            return  mode;
    }
      
}
