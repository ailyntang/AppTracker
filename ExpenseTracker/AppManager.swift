//
//  Setup.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 7/2/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation

class AppManager {

    
    let defaults = UserDefaults.standard
    private let appIdUserDefaultKey = "appIds"
    private var appIdArray: [String] = []
    private var appArray: [AppFromSearchApi] = []
    
    func getAppIds() -> [String] {
        appIdArray = defaults.stringArray(forKey: appIdUserDefaultKey)!
        return appIdArray
    }
    
    init() {
        
        let clashOfClansId = "529479190"
        let colesId = "529118855"
        let citylinkId = "1091477735"
        
        appIdArray = [clashOfClansId, colesId, citylinkId]
        defaults.set(appIdArray, forKey: appIdUserDefaultKey)
        
        
//        let newApp = AppFromSearchApi(trackId: 122232, trackName: "App Name", artworkUrl60: "http://is5.mzstatic.com/image/thumb/Purple111/v4/b4/75/7e/b4757e9e-8724-c645-5d18-ad27c3534284/source/100x100bb.jpg", description: "best app ever", averageUserRatingForCurrentVersion: 1.0, currentVersionReleaseDate: "2017-02-27T07:00:00Z", releaseNotes: "")
//        appArray.append(newApp!)
//        
//
//        let placesData = NSKeyedArchiver.archivedData(withRootObject: appArray)
//        defaults.set(placesData, forKey: "test")
//        
        
        
        
        
        // object   prints array
        // string prints nil
//        let test = defaults.stringArray(forKey: appIdUserDefaultKey)
//        print(test!.last!)
        
    }

    
    func addAppToList(appId: String) {
        appIdArray.append(appId)
        defaults.set(appIdArray, forKey: appIdUserDefaultKey)
    }
    
    
}
