//
//  Setup.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 7/2/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation

class AppManager {
    
    static let sharedManager = AppManager()
    
    private let defaults = UserDefaults.standard
    private let appIdUserDefaultKey = "appIds"
    private var appIdArray: [String] = []
    
    func getAppIds() -> [String] {
        return appIdArray
    }
    
    init() {
        
        let clashOfClansId = "529479190"
        let colesId = "529118855"
        let citylinkId = "1091477735"
        
        appIdArray = [clashOfClansId, colesId, citylinkId]
        defaults.set(appIdArray, forKey: appIdUserDefaultKey)
        
        
        // object   prints array
        // string prints nil
        let test = defaults.stringArray(forKey: appIdUserDefaultKey)
        print(test!.last!)
        
    }

    
    func addAppToList(appId: String) {
        appIdArray.append(appId)
        defaults.set(appIdArray, forKey: appIdUserDefaultKey)
    }
    
    
}
