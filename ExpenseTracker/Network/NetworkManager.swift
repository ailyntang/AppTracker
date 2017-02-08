//
//  NetworkManager.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 3/2/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class NetworkManager {

    class func loadAppAsync(appId: String, completionHandler: @escaping (App?) -> (Void)) {
        let baseUrlString = "https://itunes.apple.com/lookup?id="
        let urlString = baseUrlString + appId
        
        // The first line is repsonsible for downloading the data, and it is executed in a different thread
        Alamofire.request(urlString).responseData { (dataResponse) in
            
            // This is all executed in the main thread
            if let data = dataResponse.result.value {
                let json = JSON(data: data)
                let app = App.appFromJson(json: json)
                
                completionHandler(app)
            }
        }        
    }
    
    class func searchForApps(searchTerm: String) {
        let formattedSearchTerm = searchTerm.replacingOccurrences(of: " ", with: "+")
        let urlString = "https://itunes.apple.com/search?term=" + formattedSearchTerm + "&country=au&entity=software&limit=3"
        print("search URL" + urlString)
        
        
        Alamofire.request(urlString).responseData { dataResponse in
            if let data = dataResponse.result.value {
                let json = JSON(data: data)
                print("Search json")
                print(json)
            }
        }
        
        
    }
    
    
    
    
}
