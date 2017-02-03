//
//  ReviewOptionsTableViewController.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 27/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class ReviewOptionsTableViewController: UITableViewController {
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    let cellIdentifier = "ReviewOptionsTableViewCell"
    var options: [ReviewOption] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        options = ReviewOption.loadReviewOptions()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ReviewOptionsTableViewCell else {
            fatalError("The dequeued cell is not an instance of ReviewTableViewCell")
        }
        
        let option = options[indexPath.row]
        
        cell.optionLabel.text = option.optionType
        cell.settingButton.setTitle(option.defaultOption, for: .normal)
        
        return cell
    }

    
    // MARK: Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
  

}
