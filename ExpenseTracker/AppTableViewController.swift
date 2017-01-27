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
        
        
        // Takes a string and converts it to a date
        let dateFormatter = DateFormatter()
        let dateAsString = app.date
        
        // In the future when reading from the iTunes search API, the dateFormat will be:
        // dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        
        guard let newDate = dateFormatter.date(from: dateAsString) else {
            fatalError("The app release date from the iTunes Search API is not in the expected date format")
        }
        
        dateFormatter.dateFormat = "dd MMM yy"
        let newDateAsString = dateFormatter.string(from: newDate)
        
        cell.nameLabel.text = app.name
        cell.photoImageView.image = app.photo
        cell.ratingControl.rating = app.rating
        cell.dateLabel.text = newDateAsString

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
        
        guard let app1 = App(name: "Coles", photo: photo1, rating:3.5, date: "06 Mar-2016") else {
            fatalError("Unable to instantiate app1")
        }
        
        guard let app2 = App(name: "CityLink", photo: photo2, rating: 5, date: "05-May-2016") else {
            fatalError("Unable to instantiate app2")
        }
        
        guard let app3 = App(name: "Opal Travel", photo: photo3, rating: 4.1, date: "30-Dec-2016") else {
            fatalError("Unable to instantiate app3")
        }
        
        apps += [app1, app2, app3]
    }
    
}









