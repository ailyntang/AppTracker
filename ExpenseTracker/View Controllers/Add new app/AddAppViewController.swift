//
//  AddAppViewController.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 23/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit
import os.log

class AddAppViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var searchAppNameTextField: UITextField!
    @IBOutlet weak var appSearchResultsTable: UITableView!
    
    var app: AppFromSearchApi?
    var appArrayFromSearchResults: [AppFromSearchApi] = []
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
    
    
    // MARK: Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appArrayFromSearchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = appSearchResultsTable.dequeueReusableCell(withIdentifier: "idCell") as? AddAppTableViewCell else {
            fatalError("There's an error with the array of apps from the search query")
        }
        
        let app = appArrayFromSearchResults[indexPath.row]
        cell.setupWithSearchResults(app)
        return cell
    }
    
    
    // MARK: Table View Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
        
        // Send app name to the serach URL and reload table view to display search results
        NetworkManager.searchForApps(searchTerm: searchAppNameTextField.text!, completionHandler: { appArray in
            self.appArrayFromSearchResults = appArray
            self.appSearchResultsTable.reloadData()
        })
    }
}
