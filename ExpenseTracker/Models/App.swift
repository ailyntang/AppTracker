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
    
    var appName: String
    var appIcon: UIImage                       // This should be a URL not an image
    var currentVersionRating: Double?
    var latestReleaseDate: Date                 // the initialisation takes a date string and returns a date

    
    // MARK: Initialization
    
    init?(appName: String, appIcon: UIImage, currentVersionRating: Double?, latestReleaseDate: String) {
        
        // Initialization should fail if there is no name or if the rating is negative
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
        self.appIcon = appIcon
        self.currentVersionRating = rating
        self.latestReleaseDate = dateFormatter.date(from: latestReleaseDate)!
    }
    
    class func appFromJson(dict: NSDictionary) -> App {
        let appName = dict["name"] as! String
        let appIcon = dict["photo"] as! String
        let currentVersionRating = dict["rating"] as! Double?
        let latestReleaseDate = dict["date"] as! String
        
        let app = App(appName: appName, appIcon: UIImage(named: appIcon)!, currentVersionRating: currentVersionRating, latestReleaseDate: latestReleaseDate)
        return app!
        
    }
    
    class func loadSampleApps() -> [App] {
        
        var apps: [App] = []
        
        let url = Bundle.main.url(forResource: "sampleApps", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        
        let topLevelDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
        let appList = topLevelDictionary["apps"] as! NSArray
        
        // replace the following with a function to set this up
        for anyApp in appList {
            let appDictionary = anyApp as! NSDictionary
            
            let myApp = appFromJson(dict: appDictionary)

//            let appName = appDictionary["name"] as! String
//            let appIcon = appDictionary["photo"] as! String
//            let currentVersionRating = appDictionary["rating"] as! Double?
//            let latestReleaseDate = appDictionary["date"] as! String
//            
//            let myApp = App(appName: appName, appIcon: UIImage(named: appIcon)!, currentVersionRating: currentVersionRating, latestReleaseDate: latestReleaseDate)
            
            apps.append(myApp)
        }
    
        return apps
    }
    
    
    
//    
//    class func load_image(urlString: String) {
//        var imgURL: NSURL = NSURL(string: urlString)!
//        let request: NSURLRequest = NSURLRequest(url: imgURL as URL)
//        NSURLConnection.sendAsynchronousRequest(
//            request as URLRequest, queue: OperationQueue.mainQueue,
//            completionHandler: {(response: URLResponse!,data: NSData!,error: NSError!) -> Void in
//                if error == nil {
//                    self.image_element.image = UIImage(data: data)
//                }
//        })
//        
//        
//    }
    
    
}
