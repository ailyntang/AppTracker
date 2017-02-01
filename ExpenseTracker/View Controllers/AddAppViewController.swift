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
    
    @IBOutlet weak var testImage: UIImageView!
    
    var app: App?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
        
        // Enable the Save button only if the text field has a valid App Name
        updateSaveButtonState()
        
        load_image(urlString: "http://is5.mzstatic.com/image/thumb/Purple71/v4/4b/ce/90/4bce9064-f2e6-a93e-8921-b4881b03a651/source/100x100bb.jpg")
        
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
        
        
        // Surely I should replace this next section with "setup app" or something similar
        // Right now when things change in "app.swift", I need to change it here too
        
        let appName = nameTextField.text ?? ""
        let appIcon = UIImage(named: "defaultPhoto")
        let currentVersionRating = 1.5
        let latestReleaseDate = "01 Jan 2000"

        
        // Set the app to be passed to AppTableViewController after the unwind segue
        app = App(appName: appName, appIcon: appIcon!, currentVersionRating: currentVersionRating, latestReleaseDate: latestReleaseDate)
        
     }
    
    
    // MARK: Private Methods
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    private func load_image(urlString: String) {
        
        if let url = URL(string: urlString) {
            
                DispatchQueue.global(qos: .background).async {
                    if let data = try? Data(contentsOf: url, options: NSData.ReadingOptions.uncached) {
                        
                        DispatchQueue.main.async {
                            self.testImage.image = UIImage(data: data)
                        }
                    }
                }

        }
    }
    
    
}
