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
        
        let dummyApp = AppFromSearchApi(trackId: 1234, trackName: "Dummy", artworkUrl60: "http://is5.mzstatic.com/image/thumb/Purple111/v4/b4/75/7e/b4757e9e-8724-c645-5d18-ad27c3534284/source/100x100bb.jpg", description: "", averageUserRatingForCurrentVersion: 1, currentVersionReleaseDate: "2001-01-01T07:00:00Z", releaseNotes: "")
        
        appArray.append(dummyApp!)
       
        // This is the line that has an issue. I need to do some aDecoder and encodeWithCoder things to make it work
        // http://stackoverflow.com/questions/38607876/how-to-use-nsuserdefaults-to-store-an-array-of-custom-classes-in-swift
        // http://stackoverflow.com/questions/40266071/swift-3-xcode-8-swiftvalue-encodewithcoder-unrecognized-selector-sent-to-ins
//        defaults.setValue(NSKeyedArchiver.archivedData(withRootObject: appArray), forKey: "apps")
//        defaults.synchronize()
//        
//        let testArray: [AppFromSearchApi]
//        testArray = NSKeyedUnarchiver.unarchiveObject(with: (defaults.object(forKey: "apps") as! NSData) as Data) as! [AppFromSearchApi]
//        print(testArray[0].trackName)
        
    }

    
    func addAppToList(appId: String) {
        appIdArray.append(appId)
        defaults.set(appIdArray, forKey: appIdUserDefaultKey)
    }
    
    
}
