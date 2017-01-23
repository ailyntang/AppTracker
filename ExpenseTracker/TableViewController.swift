//
//  TableViewController.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 20/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
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









