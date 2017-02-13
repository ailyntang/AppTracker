//
//  App.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 23/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation
import SwiftyJSON

struct App {
    
    // MARK: Properties
    
    var trackName: String
    var artworkUrl60: String
    var averageUserRatingForCurrentVersion: Double?
    var currentVersionReleaseDate: Date                 // the initialisation takes a date string and returns a date
    
    
    // MARK: Initialization
    
    init?(trackName: String, artworkUrl60: String, averageUserRatingForCurrentVersion: Double?, currentVersionReleaseDate: String) {
        
        // Initialization should fail if for the following conditions
//        if appName.isEmpty || currentVersionAppStoreRating < 0 {
//            return nil
//        }
//
        
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
            let dummyApp: App? = nil
            return dummyApp!
        }
        
    }
    
    

       
    
}



    
    

    
    

