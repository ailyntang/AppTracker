//
//  App.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 23/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation
import SwiftyJSON
import os.log

class App: NSObject {
    
    // MARK: Properties
    
    var trackName: String
    var artworkUrl60: String?
    var averageUserRatingForCurrentVersion: Double?
    var currentVersionReleaseDate: Date                 // the initialisation takes a date string and returns a date
    
    
    // MARK: Types
    struct PropertyKey{
        static let trackName = "trackName"
        static let artworkUrl60 = "artworkUrl60"
        static let averageUserRatingForCurrentVersion = "averageUserRatingForCurrentVersion"
        static let currentVersionReleaseDate = "currentVersionReleaseDate"
    }
    
    // MARK: Initialization
    
    init?(trackName: String, artworkUrl60: String?, averageUserRatingForCurrentVersion: Double?, currentVersionReleaseDate: String) {
        
        let rating = averageUserRatingForCurrentVersion ?? 0.0
        
        // Takes the date as a string and converts it to a date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        
        // Initialize stored properties
        self.trackName = trackName
        self.artworkUrl60 = artworkUrl60
        self.averageUserRatingForCurrentVersion = rating
        self.currentVersionReleaseDate = dateFormatter.date(from: currentVersionReleaseDate)!
    }
    
    
    
    // MARK: Functions

    static func appFromJson(json: JSON) -> App{
        
        var newApp: App?
        
        // This url doesn't have current Version Rating. Neither does the review url.
        if let app = json["results"].array?.first {
            let trackName = app["trackCensoredName"].string
            let artworkUrl60 = app["artworkUrl60"].string
            let averageUserRatingForCurrentVersion = 3.0
            let currentVersionReleaseDate = app["currentVersionReleaseDate"].string
            
            newApp = App(trackName: trackName!, artworkUrl60: artworkUrl60!, averageUserRatingForCurrentVersion: averageUserRatingForCurrentVersion, currentVersionReleaseDate: currentVersionReleaseDate!)!
            return newApp!
            
        } else {

            // Sometimes the iTunes lookup fails on the trackId. It fails with the 9Now app: 542088539 and many others that I haven't tracked
            // If this happens, it will load the dummyApp instead
            let dummyApp = App(trackName: "Uh oh, something went wrong", artworkUrl60: nil, averageUserRatingForCurrentVersion: 1.0, currentVersionReleaseDate: "2001-01-01T07:00:00Z")
            
            return dummyApp!
        }
        
    }
    
    static func saveApps() {
        var apps = [App]()
        
//        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(apps, toFile: self.ArchiveURL.path)
    }
       
    
}

//extension App: NSCoding {
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(trackName, forKey: PropertyKey.trackName)
//        aCoder.encode(artworkUrl60, forKey: PropertyKey.artworkUrl60)
//        aCoder.encode(averageUserRatingForCurrentVersion, forKey: PropertyKey.averageUserRatingForCurrentVersion)
//        aCoder.encode(currentVersionReleaseDate, forKey: PropertyKey.currentVersionReleaseDate)
//    }
//}

    
    

    
    

