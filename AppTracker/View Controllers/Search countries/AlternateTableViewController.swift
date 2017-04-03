//
//  AlternateTableViewController.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 13/2/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class AlternateTableViewController: UITableViewController {
    
    var search = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshTableView), name: NSNotification.Name.init("searchResultsUpdated"), object: nil)
    }
    
    func refreshTableView(notification: Notification) {
        search = notification.object as! [String]
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return search.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LargeCell", for: indexPath) as! AlternateTableViewCell
        cell.configureCell(countryName:search[indexPath.row])
        return cell
    }

    deinit{
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.init("searchResultsUpdated"), object: nil)
    }
   
}
