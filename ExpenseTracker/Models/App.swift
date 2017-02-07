//
//  App.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 23/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation
import SwiftyJSON

class App {
    
    // MARK: Properties
    
    var appName: String
    var appIconUrl: String
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

    class func appFromJson(json: JSON) -> App{
        
        var newApp: App?
        
        // This url doesn't have current Version Rating. Neither does the review url.
        if let app = json["results"].array?.first {
            let appName = app["trackCensoredName"].string
            let appIconUrl = app["artworkUrl60"].string
            let currentVersionRating = 3.0
            let latestReleaseDate = app["currentVersionReleaseDate"].string
            
            newApp = App(appName: appName!, appIconUrl: appIconUrl!, currentVersionRating: currentVersionRating, latestReleaseDate: latestReleaseDate!)!
            return newApp!
            
        } else {
            let dummyApp: App? = nil
            return dummyApp!
        }
        
    }
    

 
    
    
}



    
    

    
    

