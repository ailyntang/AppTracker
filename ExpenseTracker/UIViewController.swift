//
//  ViewController.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 13/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet private weak var appName: UITextField!
    @IBOutlet weak var valueSwitchApple: UISwitch!
    @IBOutlet weak var valueSwitchGoogle: UISwitch!
    @IBOutlet weak var valueDatePicker: UIDatePicker!

    
    
    @IBOutlet weak var labelAppName: UILabel!
    @IBOutlet weak var labelApple: UILabel!
    @IBOutlet weak var labelNumReviews: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    
    // Can I just cut and paste this, or move it without needing to redo all the connections?
    @IBOutlet weak var valueSlider: UISlider!
    
   
    

    

    
    // MARK: Actions

    @IBAction func searchButton(_ sender: UIButton) {
        labelAppName.text = appName.text!
        appName.text = ""
        appName.resignFirstResponder()
    }
    
    @IBAction func switchChangedApple(_ sender: UISwitch) {

        if (valueSwitchApple.isOn) {
            labelApple.text! = "On!"
        } else {
            labelApple.text! = "Off!"
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        labelNumReviews.text! = String(Int(valueSlider.value))
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let date:Date = valueDatePicker.date
        let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        labelDate.text = formatter.string(from: date)
    }
    

    
    
    
    
    
}


/*
    Backlog
 
    Put switches into a Table Row. This is meant to be best practice.
 
 
    Next step: Summary section - make stack views, constrain layout to resize
 
 
 
*/
