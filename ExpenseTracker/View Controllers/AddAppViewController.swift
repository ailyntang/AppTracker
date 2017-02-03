//
//  AddAppViewController.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 23/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit
import os.log

class AddAppViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var app: App?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
        
        // Enable the Save button only if the text field has a valid App Name
        // The number keypad doesn't have a "go" button to get out of this state
//        updateSaveButtonState()
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing
//        saveButton.isEnabled = false
    }
    

    
    // MARK: Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let appId = nameTextField.text ?? ""
        
        let newApp = App.loadApp(appId: appId) ?? nil
        app = newApp
        
    }
    
    
    // MARK: Private Methods
    
//    private func updateSaveButtonState() {
//        // Disable the Save button if the text field is empty
//        let text = nameTextField.text ?? ""
//        saveButton.isEnabled = !text.isEmpty
//    }


}
