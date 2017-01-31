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
    var appIcon: UIImage?                         // this should not be optional. All apps on the app stores have a photo
    var currentVersionAppStoreRating: Double    // this should be Double? as it could be nil
    var latestReleaseDate: Date                 // the initialisation takes a date string and returns a date

    
    // MARK: Initialization

    // Ideally we'd have this function as "loadSampleApps" is doing too much
//    func fromJson(_ dic: NSDictionary) -> App {
//        
//    }
    
    init?(appName: String, appIcon: UIImage?, currentVersionAppStoreRating: Double, latestReleaseDate: String) {
        
        // Initialization should fail if there is no name or if the rating is negative
        if appName.isEmpty || currentVersionAppStoreRating < 0 {
            return nil
        }
        
        
        // Takes the date as a string and converts it to a date
        // In the future when reading from the iTunes search API, the dateFormat will be:
      
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        dateFormatter.dateFormat = "dd MMM yyyy"
        
        
        // Initialize stored properties
        self.appName = appName
        self.appIcon = appIcon
        self.currentVersionAppStoreRating = currentVersionAppStoreRating
        self.latestReleaseDate = dateFormatter.date(from: latestReleaseDate)!
    }
    
    
    class func loadSampleApps() -> [App] {
        
        var apps: [App] = []
        
        let url = Bundle.main.url(forResource: "sampleApps", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        
        let topLevelDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
        let appList = topLevelDictionary["apps"] as! NSArray
        
        // Playing around with photo from URL
//        let imageURL = "http://is5.mzstatic.com/image/thumb/Purple71/v4/4b/ce/90/4bce9064-f2e6-a93e-8921-b4881b03a651/source/100x100bb.jpg"
        
//        if let filePath = Bundle.main.url(forResource: "imageName", ofType: "jpg"), let image = UIImage(contentsOfFile: filePath) {
//            imageView.contentMode = .scaleAspectFit
//            imageView.image = image
//        }
        
        
        for anyApp in appList {
            let appDictionary = anyApp as! NSDictionary
            
            let appName = appDictionary["name"] as! String
            let appIcon = appDictionary["photo"] as! String
            let currentVersionAppStoreRating = appDictionary["rating"] as! Double
            let latestReleaseDate = appDictionary["date"] as! String
            
            let myApp = App(appName: appName, appIcon: UIImage(named: appIcon), currentVersionAppStoreRating: currentVersionAppStoreRating, latestReleaseDate: latestReleaseDate)
            
            
            apps.append(myApp!)
        }
    
        return apps
    }
    
}
