//
//  ViewController.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 13/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

/*  Questions
    How do I customise the keyboard? The keyboard I want is not in the attributes list.
    I'd like number pad with a decimal point.
*/

import UIKit

class ViewController: UIViewController {

    // MARK: Variables
    @IBOutlet private weak var amountEntered: UITextField!
    @IBOutlet private weak var descriptionLabel: UITextField!
    @IBOutlet private weak var testLabel: UILabel!
    @IBOutlet var dateChooser: UIDatePicker!
    @IBOutlet var lblOutput: UILabel!

    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: UI Functions
    
    @IBAction func addExpenseButton(_ sender: UIButton) {
        var displayAmount = "0.0"
        var displayDescription = "nothing"
        
        if let amount = amountEntered.text, !amount.isEmpty {
            displayAmount = amount
            
            // This works for $3.095 -> $3.10, but $3.9 remains $3.9
//            displayAmount = String(round(Double(amount)! * 100) / 100)
        }
    
        if let label = descriptionLabel.text, !label.isEmpty {
            displayDescription = label
        }
 
        testLabel.text = "You spent $\(displayAmount) on \(displayDescription)"
        
        amountEntered.resignFirstResponder()
        descriptionLabel.resignFirstResponder()
    }

    @IBAction func dateChosen(_ sender: UIDatePicker) {
        
    }
}

