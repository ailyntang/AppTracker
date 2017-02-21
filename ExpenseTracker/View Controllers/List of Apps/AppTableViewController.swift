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
    
    var appManager: AppManager! // This is not used or initialised anywhere
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.apps.removeAll()
        for appId in appManager.getAppIds() {
            NetworkManager.loadAppAsync(appId: appId, completionHandler: { myApp in
                self.apps.append(myApp!)
                self.tableView.reloadData()
            })
        }
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
    
    // This function is called when the "save" button is pressed on "New App" scene
    @IBAction func unwindToAppList(sender: UIStoryboardSegue) {
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)

//        let navVC = segue.destination as? UINavigationController
//        let addAppVC = navVC?.viewControllers.first as? SearchAppsViewController
//        addAppVC?.appManager = self.appManager
        

    }

}









