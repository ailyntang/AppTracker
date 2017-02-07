//
//  Setup.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 7/2/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation

class Setup {
    
    struct SetupVariables {
        static let defaults = UserDefaults.standard
        static let appIdUserDefaultKey = "appIds"
        static var appIdArray: [String] = []
    }
    
    
    class func setupAppList() {
        
        let clashOfClansId = "529479190"
        let colesId = "529118855"
        let citylinkId = "1091477735"
        
        SetupVariables.appIdArray = [clashOfClansId, colesId, citylinkId]
        SetupVariables.defaults.set(SetupVariables.appIdArray, forKey: SetupVariables.appIdUserDefaultKey)
        
        
        // object   prints array
        // string prints nil
        let test = SetupVariables.defaults.stringArray(forKey: SetupVariables.appIdUserDefaultKey)
        print(test!.last!)
        
    }

    
    class func addAppToList(appId: String) {
        SetupVariables.appIdArray.append(appId)
        SetupVariables.defaults.set(SetupVariables.appIdArray, forKey: SetupVariables.appIdUserDefaultKey)
    }
    
    
}
