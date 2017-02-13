//
//  SearchAppsViewController.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 10/2/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit


class SearchAppsViewController: UIViewController {

    @IBOutlet weak var countryTable: UITableView!
    
    var searchArray = [String]() {
        didSet {
            NotificationCenter.default.post(name: NSNotification.Name.init("searchResultsUpdated"), object: searchArray)
        }
    }
    
    var countrySearchController: UISearchController = ({
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let alternateController = storyBoard.instantiateViewController(withIdentifier: "aTV") as! AlternateTableViewController
        let controller = UISearchController(searchResultsController: alternateController)
        
//        let controller = UISearchController(searchResultsController: nil) // display results in same view controller
        controller.hidesNavigationBarDuringPresentation = false
        controller.dimsBackgroundDuringPresentation = false
        controller.searchBar.searchBarStyle = .minimal
        controller.searchBar.sizeToFit()
        return controller
    })()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure countryTable
        countryTable.tableHeaderView = countrySearchController.searchBar
        countrySearchController.searchResultsUpdater = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}




extension SearchAppsViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch countrySearchController.isActive {
        case true:
            return searchArray.count
        case false:
            return Countries.list.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = countryTable.dequeueReusableCell(withIdentifier: "idCell") as! SearchAppsTableViewCell
        cell.textLabel?.text = ""
        cell.textLabel?.attributedText = NSAttributedString(string: "")
        
        switch countrySearchController.isActive {
        case true:
            cell.configureCellWith(searchTerm:countrySearchController.searchBar.text!, cellText: searchArray[indexPath.row])
            return cell
        case false:
            cell.textLabel?.text! = Countries.list[indexPath.row]
            return cell
        }
    }
}

extension SearchAppsViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SearchAppsViewController: UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController)
    {
        searchArray.removeAll(keepingCapacity: false)
        print("inside updateSearchResults: search bar was tapped")
        
        let range = searchController.searchBar.text!.characters.startIndex ..< searchController.searchBar.text!.characters.endIndex
        var searchString = String()
        
        searchController.searchBar.text?.enumerateSubstrings(in: range, options: .byComposedCharacterSequences, { (substring, substringRange, enclosingRange, success) in
            searchString.append(substring!)
            searchString.append("*")
        })
        
        print(searchString)
        
        let searchPredicate = NSPredicate(format: "SELF LIKE[cd] %@", searchString)
        let array = (Countries.list as NSArray).filtered(using: searchPredicate)
        searchArray = array as! [String]
        countryTable.reloadData()
        
    }
}


    


