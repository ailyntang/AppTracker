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
    @IBOutlet weak var searchAppNameTextField: UITextField!
    @IBOutlet weak var appSearchResults: UITableView!
    
    var app: App?
    var appManager: AppManager?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
        
        updateSaveButtonState()
                
        
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
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing
        saveButton.isEnabled = false
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
        
        let appId = nameTextField.text
        appManager?.addAppToList(appId: appId!)

    }
    
    
    
    // MARK: Private Methods
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
        // Send app name to the serach URL
        NetworkManager.searchForApps(searchTerm: searchAppNameTextField.text!)
        
        // Display search results in the table view
        
    }
    
    
}
