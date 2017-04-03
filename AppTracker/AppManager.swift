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
  
  func getAppIds() -> [String] {
    return appIdArray
  }
  
  init() {
    let clashOfClansId = "529479190"
    let colesId = "529118855"
    let citylinkId = "1091477735"
    let defaultApps = [clashOfClansId, colesId, citylinkId]
    
    appIdArray = defaults.stringArray(forKey: appIdUserDefaultKey) ?? defaultApps
  }
  
  func addAppToList(appId: String) {
    appIdArray.append(appId)
    defaults.set(appIdArray, forKey: appIdUserDefaultKey)
  }
  
  
}
