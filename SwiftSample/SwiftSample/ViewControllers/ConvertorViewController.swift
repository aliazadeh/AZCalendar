//
//  ConvertorViewController.swift
//  SwiftSample
//
//  Created by Ali on 10/26/16.
//  Copyright © 2016-2024 Ali Azadeh. All rights reserved.
//

import UIKit

final class ConvertorViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var txtOriginDay: UITextField!
    @IBOutlet private weak var txtOriginMonth: UITextField!
    @IBOutlet private weak var txtOriginYear: UITextField!
    @IBOutlet private weak var txtDestinationDay: UITextField!
    @IBOutlet private weak var txtDestinationMonth: UITextField!
    @IBOutlet private weak var txtDestinationYear: UITextField!
    @IBOutlet private weak var segCtrOrigin: UISegmentedControl!
    @IBOutlet private weak var segCtrDestination: UISegmentedControl!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
    }
    
    // MARK: - Setup
    private func setupTextFields() {
        // Set keyboard type to number pad for all text fields
        [txtOriginDay, txtOriginMonth, txtOriginYear,
         txtDestinationDay, txtDestinationMonth, txtDestinationYear].forEach { textField in
            textField?.keyboardType = .numberPad
        }
    }
    
    // MARK: - IBActions
    @IBAction private func segCtrOriginSelected(_ sender: UISegmentedControl) {
        updateDestinationSegmentTitles()
    }
    
    @IBAction private func btnConvert(_ sender: UIButton) {
        view.endEditing(true)
        
        guard let originDate = createOriginDate() else {
            showInvalidInputAlert()
            return
        }
        
        let (originCalendar, destinationCalendar) = getConvertMode()
        let convertedDate = AZCalendar.convertDate(
            inputType: originCalendar,
            inputDate: originDate,
            outputType: destinationCalendar
        )
        
        displayConvertedDate(convertedDate)
    }
    
    // MARK: - Private Methods
    private func updateDestinationSegmentTitles() {
        switch segCtrOrigin.selectedSegmentIndex {
        case 0:
            segCtrDestination.setTitle("Persian", forSegmentAt: 0)
            segCtrDestination.setTitle("Hijri", forSegmentAt: 1)
        case 1:
            segCtrDestination.setTitle("Gregorian", forSegmentAt: 0)
            segCtrDestination.setTitle("Hijri", forSegmentAt: 1)
        case 2:
            segCtrDestination.setTitle("Gregorian", forSegmentAt: 0)
            segCtrDestination.setTitle("Persian", forSegmentAt: 1)
        default:
            break
        }
    }
    
    private func createOriginDate() -> DateType? {
        guard let dayText = txtOriginDay.text,
              let monthText = txtOriginMonth.text,
              let yearText = txtOriginYear.text,
              let day = Int(dayText),
              let month = Int(monthText),
              let year = Int(yearText),
              isValidDate(day: day, month: month, year: year) else {
            return nil
        }
        
        return DateType(day: day, month: month, year: year)
    }
    
    private func isValidDate(day: Int, month: Int, year: Int) -> Bool {
        return day >= 1 && day <= 31 &&
               month >= 1 && month <= 12 &&
               year > 0
    }
    
    private func displayConvertedDate(_ date: DateType) {
        txtDestinationDay.text = "\(date.day)"
        txtDestinationMonth.text = "\(date.month)"
        txtDestinationYear.text = "\(date.year)"
    }
    
    private func showInvalidInputAlert() {
        let alert = UIAlertController(
            title: "Invalid Input",
            message: "Please enter valid day, month, and year values.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    private func getConvertMode() -> (origin: CalendarType, destination: CalendarType) {
        let originIndex = segCtrOrigin.selectedSegmentIndex
        let destinationIndex = segCtrDestination.selectedSegmentIndex
        
        switch originIndex {
        case 0: // Gregorian origin
            return destinationIndex == 0
                ? (.gregorian, .persian)
                : (.gregorian, .hijri)
        case 1: // Persian origin
            return destinationIndex == 0
                ? (.persian, .gregorian)
                : (.persian, .hijri)
        case 2: // Hijri origin
            return destinationIndex == 0
                ? (.hijri, .gregorian)
                : (.hijri, .persian)
        default:
            return (.gregorian, .persian)
        }
    }
}
