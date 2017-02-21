//
//  SearchAppsViewController.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 14/2/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class SearchAppsViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var appSearchResultsTable: UITableView!
    var appArrayFromSearchResults: [AppFromSearchApi] = []
    var appManager: AppManager?     // I don't know how to initiatlise this
    
    
    var appSearchController: UISearchController!
    
    
    func setupSearch() {
        
        
        let controller = UISearchController(searchResultsController: nil)
        controller.hidesNavigationBarDuringPresentation = true
        controller.dimsBackgroundDuringPresentation = false
        controller.searchBar.searchBarStyle = .minimal
        controller.searchBar.sizeToFit()
        appSearchController = controller
        
        definesPresentationContext = true       // stops the search bar from appearing on other VCs
        extendedLayoutIncludesOpaqueBars  = true
    }
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearch()
        
        appSearchResultsTable.tableHeaderView = appSearchController.searchBar
        appSearchController.searchResultsUpdater = self
        appSearchResultsTable.rowHeight = 90.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SearchAppsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch appSearchController.isActive {
        case true:
            return appArrayFromSearchResults.count
        case false:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell") as! SearchAppsTableViewCell
        cell.textLabel?.text = ""
        cell.textLabel?.attributedText = NSAttributedString(string: "")
        
        switch appSearchController.isActive {
        case true:
            cell.configureCellWith(app: appArrayFromSearchResults[indexPath.row])
            return cell
        case false:
            return cell
        }
    }
}


extension SearchAppsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = (tableView.indexPathForSelectedRow?.last)! as Int
        let selectedApp = appArrayFromSearchResults[selectedRow]
        let selectedAppId = String(Int(selectedApp.trackId))
        
        // I didn't know how to initialise appManager so I redefined the user defaults
        let defaults = UserDefaults.standard
        var appIdsForUserDefaults = defaults.stringArray(forKey: "appIds")
        appIdsForUserDefaults!.append(selectedAppId)
        defaults.set(appIdsForUserDefaults, forKey: "appIds")
    }
}


extension SearchAppsViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController){
        let range = searchController.searchBar.text!.characters.startIndex ..< searchController.searchBar.text!.characters.endIndex
        var searchString = String()
        
        searchController.searchBar.text?.enumerateSubstrings(in: range, options: .byComposedCharacterSequences, { (substring, substringRange, enclosingRange, success) in
            searchString.append(substring!)
        })
        
        let numCharacters = searchString.characters.count
        
        if numCharacters >= 3 {
            NetworkManager.searchForApps(searchTerm: searchString, completionHandler: { appArray in
                self.appArrayFromSearchResults = appArray
                self.appSearchResultsTable.reloadData()
            })
        
        }
    }
}



