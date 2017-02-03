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
        if let appList = json["results"].array {
            for app in appList {
                let appName = app["trackCensoredName"].string
                let appIconUrl = app["artworkUrl60"].string
                let currentVersionRating = 3.0
                let latestReleaseDate = app["currentVersionReleaseDate"].string
                
                newApp = App(appName: appName!, appIconUrl: appIconUrl!, currentVersionRating: currentVersionRating, latestReleaseDate: latestReleaseDate!)!
            }
        }
        
        return newApp!
        
/*
        // Try to remove for loop above, because there is only ever one element in this array
        // I tried, but this returns nil
        let testAppName = json[1]["results"][2]["trackCensoredName"].string
        print(testAppName)
        
        return app
*/
        
    }
    
    

    
    class func loadApp(appId: String) -> App {

        let baseUrlString = "https://itunes.apple.com/lookup?id="
        // from iTunes RSS feed
        let urlString = baseUrlString + appId
        let url2 = URL(string: urlString)
    
        let data2 = try! Data(contentsOf: url2!)
        let json2 = JSON(data: data2)
    
        return appFromJson(json: json2)
        
        
        
        
        
        
        
        
        
        // Trying to use another thread. 
        // It compiles, but the background thread doesn't pass the apps info back to the return value in time.
//        var apps: [App] = []
//        
//        let urlString = "https://itunes.apple.com/lookup?id=529118855"
//        
//        if let url2 = URL(string: urlString) {
//            print("inside if statement for url is a url")
//            DispatchQueue.global(qos: .background).async{
//                print("insde dispatch queue")
//                let data = try! Data(contentsOf: url2, options: NSData.ReadingOptions.uncached)
//                let json = JSON(data: data)
//                apps = appsFromJson(json: json)
//                print(apps)
//            }
//        }
//        
//        print("before returning apps")
//        print(apps)
//        return apps
    
    
    }
    
    
}



    
    

    
    

