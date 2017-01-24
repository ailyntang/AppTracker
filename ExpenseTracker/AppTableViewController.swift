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
        loadSampleApps()
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
        
        cell.nameLabel.text = app.name
        cell.photoImageView.image = app.photo
        cell.ratingControl.rating = app.rating
        cell.dateLabel.text = app.date

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
    
    
    
    // MARK: Private Methods
    private func loadSampleApps() {
        let photo1 = UIImage(named: "coles")
        let photo2 = UIImage(named: "citylink")
        let photo3 = UIImage(named: "transport")
        
        guard let app1 = App(name: "Coles", photo: photo1, rating:3, date: "2-Mar-2016") else {
            fatalError("Unable to instantiate app1")
        }
        
        guard let app2 = App(name: "CityLink", photo: photo2, rating: 5, date: "5-May-2016") else {
            fatalError("Unable to instantiate app2")
        }
        
        guard let app3 = App(name: "Opal Travel", photo: photo3, rating: 4, date: "30-Dec-2016") else {
            fatalError("Unable to instantiate app3")
        }
        
        apps += [app1, app2, app3]
    }
    
}









