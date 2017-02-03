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

    class func appsFromJson(json: JSON) -> [App]{
        var apps: [App] = []
        

        // from sampleApps.json
//        if let appList = json["apps"].array {
//            for app in appList {
//                let appName = app["name"].string
//                let appIconUrl = app["photo"].string
//                let currentVersionRating = app["rating"].double
//                let latestReleaseDate = app["date"].string
//                
//                let newApp = App(appName: appName!, appIconUrl: appIconUrl!, currentVersionRating: currentVersionRating, latestReleaseDate: latestReleaseDate!)
//                apps.append(newApp!)
//            }
//        }
        
        
        // from actual itunes url - works fine
        // This url doesn't have current Version Rating. Neither does the review url.
        if let appList = json["results"].array {
            for app in appList {
                let appName = app["trackCensoredName"].string
                let appIconUrl = app["artworkUrl60"].string
                let currentVersionRating = 3.0
                let latestReleaseDate = app["currentVersionReleaseDate"].string
                
                let newApp = App(appName: appName!, appIconUrl: appIconUrl!, currentVersionRating: currentVersionRating, latestReleaseDate: latestReleaseDate!)
                
                apps.append(newApp!)
            }
        }
        
        return apps
    }
    
    

    
    class func loadApp(appId: String) -> [App] {

        let baseUrlString = "https://itunes.apple.com/lookup?id="
        // from iTunes RSS feed
        let urlString = baseUrlString + appId
        let url2 = URL(string: urlString)
    
        let data2 = try! Data(contentsOf: url2!)
        let json2 = JSON(data: data2)
    
        return appsFromJson(json: json2)
        
        
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


        // MARK: Functions without SwiftyJSON
        
//    class func appFromJson(dict: NSDictionary) -> App {
//        let appName = dict["name"] as! String
//        let appIconUrl = dict["photo"] as! String
//        let currentVersionRating = dict["rating"] as! Double?
//        let latestReleaseDate = dict["date"] as! String
//
//        let app = App(appName: appName, appIconUrl: appIconUrl, currentVersionRating: currentVersionRating, latestReleaseDate: latestReleaseDate)
//        return app!
//        
//    }
//        class func loadSampleApps() -> [App] {
        
//        // Original JSON parsing without SwiftyJSON, all works fine
//        var apps: [App] = []
//        
//        let url = Bundle.main.url(forResource: "sampleApps", withExtension: "json")!
//        let data = try! Data(contentsOf: url)
//        
//        let topLevelDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
//        let appList = topLevelDictionary["apps"] as! NSArray
//        
//        for anyApp in appList {
//            let appDictionary = anyApp as! NSDictionary
//            let myApp = appFromJson(dict: appDictionary)
//            apps.append(myApp)
//        }
//    
//        return apps
    
    
    

    
    

