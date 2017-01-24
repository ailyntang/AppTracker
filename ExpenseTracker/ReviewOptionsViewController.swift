//
//  ViewController.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 13/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class ReviewOptionsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var versionTextField: UITextField!
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet private weak var searchPhrase: UITextField!
    @IBOutlet weak var versionPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIPickerView!
    
    var versionOptions = ["Current version", "All versions"]
    var dateOptions = ["Newest to oldest", "Oldest to newest"]
    
    
    // MARK: Picker Data Source protocols
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var options = versionOptions.count
        
        if pickerView == datePicker {
            
        }
        
        return options
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return versionOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.versionTextField.text = self.versionOptions[row]
        self.versionPicker.isHidden = true
    }
    
    
    // MARK: Text Field Delegate protocols
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.versionPicker.isHidden = false
    }
    

    
}
