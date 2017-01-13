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
    @IBOutlet weak var switchAppleAppStore: UISwitch!
    @IBOutlet weak var switchGooglePlayStore: UISwitch!
    @IBOutlet weak var labelApple: UILabel!
    
    
    
    


    
    // MARK: Actions

    @IBAction func switchChanged(_ sender: UISwitch) {

        // This code works - just testing to see how switches work
//        if (switchAppleAppStore.isOn) {
//            labelApple.text! = "On!"
//        } else {
//            labelApple.text! = "Off!"
//        }
    }
}


/*
    Backlog
 
    Put switches into a Table Row. This is meant to be best practice.
*/
