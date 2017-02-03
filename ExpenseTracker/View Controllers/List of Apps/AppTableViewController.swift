//
//  TableViewController.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 20/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class AppTableViewController: UITableViewController {

    let cellIdentifier = "AppTableViewCell"
    var apps: [App] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data
//        NetworkManager.searchAppsWithName("clash of clans") { listOfAppsFound, error in
//            print("results: " + listOfAppsFound)
//        }
        let clashOfClansId = "529479190"
        let colesId = "529118855"
        let citylinkId = "1091477735"
        
        apps.append(App.loadApp(appId: clashOfClansId))
        apps.append(App.loadApp(appId: colesId))
        apps.append(App.loadApp(appId: citylinkId))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AppTableViewCell else {
            fatalError("The dequeued cell is not an instance of AppTableViewCell")
        }
        
        // Fetches the approporiate app for the data source layout
        let app = apps[indexPath.row]
        cell.setupWithApp(app)
        return cell
    }

    
    // MARK: Actions
    @IBAction func unwindToAppList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddAppViewController, let app = sourceViewController.app {
            // Add a new app
            let newIndexPath = IndexPath(row: apps.count, section: 0)
            apps.append(app)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

    
}









