//
//  App.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 23/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class App {
    
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Double
    var date: Date  // the initialisation takes a date string and returns a date

    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Double, date: String) {
        
        // Initialization should fail if there is no name or if the rating is negative
        if name.isEmpty || rating < 0 {
            return nil
        }
        
        
        // Takes the date as a string and converts it to a date
        // In the future when reading from the iTunes search API, the dateFormat will be:
      
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        dateFormatter.dateFormat = "dd MMM yyyy"
        
        
        // Initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
        self.date = dateFormatter.date(from: date)!
    }
    
    
    class func loadSampleApps() -> [App] {
        
        var apps: [App] = []
        
        let url = Bundle.main.url(forResource: "sampleApps", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        
        let topLevelDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
        let appList = topLevelDictionary["apps"] as! NSArray
        
        for anyApp in appList {
            let appDictionary = anyApp as! NSDictionary
            
            let name = appDictionary["name"] as! String
            let photo = appDictionary["photo"] as! String
            let rating = appDictionary["rating"] as! Double
            let date = appDictionary["date"] as! String
            
            let myApp = App(name: name, photo: UIImage(named: photo), rating: rating, date: date)
            
            apps.append(myApp!)
        }
    
        return apps
    }
    
}
