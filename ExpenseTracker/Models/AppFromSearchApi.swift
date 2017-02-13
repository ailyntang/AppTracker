//
//  AppFromSearchApi.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 13/2/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation
import SwiftyJSON

struct AppFromSearchApi {
    
    // MARK: Properties
    
    var trackId: Double
    var trackName: String
    var artworkUrl60: String
    var description: String
    var averageUserRatingForCurrentVersion: Double?
    var currentVersionReleaseDate: Date
    var releaseNotes: String
    
    
    // MARK: Initialization
    
    init?(trackId: Double, trackName: String, artworkUrl60: String, description: String, averageUserRatingForCurrentVersion: Double?, currentVersionReleaseDate: String, releaseNotes: String) {
        
        let rating = averageUserRatingForCurrentVersion ?? 0.0
        
        // Takes date as a string and converts it to a date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        // Initialize stored properties
        self.trackId = trackId
        self.trackName = trackName
        self.artworkUrl60 = artworkUrl60
        self.description = description
        self.averageUserRatingForCurrentVersion = rating
        self.currentVersionReleaseDate = dateFormatter.date(from: currentVersionReleaseDate)!
        self.releaseNotes = releaseNotes
        
    }
    
    
    // MARK: Functions
    
    static func appFromSearchApiJson(json: JSON) -> [AppFromSearchApi] {
        
        var newApp: AppFromSearchApi?
        var appsFromSearchApiArray: [AppFromSearchApi] = []
        
        if let appsFromSearchApi = json["results"].array {
            for app in appsFromSearchApi {
                let trackId = app["trackId"].double
                let trackName = app["trackName"].string
                let artworkUrl60 = app["artworkUrl60"].string
                let description = app["description"].string
                let averageUserRatingForCurrentVersion = app["averageUserRatingForCurrentVersion"].double
                let currentVersionReleaseDate = app["currentVersionReleaseDate"].string
                let releaseNotes = app["releaseNotes"].string
                
                newApp = AppFromSearchApi(trackId: trackId!, trackName: trackName!, artworkUrl60: artworkUrl60!, description: description!, averageUserRatingForCurrentVersion: averageUserRatingForCurrentVersion, currentVersionReleaseDate: currentVersionReleaseDate!, releaseNotes: releaseNotes!)
                
                appsFromSearchApiArray.append(newApp!)
            }
        }
        
        return appsFromSearchApiArray
        
    }
    
}
