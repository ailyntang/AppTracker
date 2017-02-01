//
//  App.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 23/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation

class App {
    
    // MARK: Properties
    
    var appName: String
    var appIconUrl: String                       // This should be a URL not an image
    var currentVersionRating: Double?
    var latestReleaseDate: Date                 // the initialisation takes a date string and returns a date

    
    // MARK: Initialization
    
    init?(appName: String, appIconUrl: String, currentVersionRating: Double?, latestReleaseDate: String) {
        
        // Initialization should fail if for the following conditions
//        if appName.isEmpty || currentVersionAppStoreRating < 0 {
//            return nil
//        }
//
        
        let rating = currentVersionRating ?? 0.0
        
        // Takes the date as a string and converts it to a date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        
        // Initialize stored properties
        self.appName = appName
        self.appIconUrl = appIconUrl
        self.currentVersionRating = rating
        self.latestReleaseDate = dateFormatter.date(from: latestReleaseDate)!
    }
    
    
    
    // MARK: Functions
    
    class func appFromJson(dict: NSDictionary) -> App {
        let appName = dict["name"] as! String
        let appIconUrl = dict["photo"] as! String
        let currentVersionRating = dict["rating"] as! Double?
        let latestReleaseDate = dict["date"] as! String
        
        let app = App(appName: appName, appIconUrl: appIconUrl, currentVersionRating: currentVersionRating, latestReleaseDate: latestReleaseDate)
        return app!
        
    }
    
    
    class func loadSampleApps() -> [App] {
        
        var apps: [App] = []
        
        let url = Bundle.main.url(forResource: "sampleApps", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        
        let topLevelDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
        let appList = topLevelDictionary["apps"] as! NSArray
        
        for anyApp in appList {
            let appDictionary = anyApp as! NSDictionary
            let myApp = appFromJson(dict: appDictionary)
            apps.append(myApp)
        }
    
        return apps
    }
    
    

    
    
}
