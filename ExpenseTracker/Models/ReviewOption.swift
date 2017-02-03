//
//  ReviewOption.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 27/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation

class ReviewOption {
    
    // MARK: Properties
    
    var optionType: String
    var defaultOption: String
    
    
    // MARK: Initialization
    
    init?(optionType: String, defaultOption: String) {
        //Initialize stored properties
        self.optionType = optionType
        self.defaultOption = defaultOption
    }
    
    
    class func reviewOptionsFromJson(json: JSON) -> [ReviewOption] {
        var optionsArray: [ReviewOption] = []
        
        let reviewOptionsList = json["reviewOptions"].array
        
        for option in reviewOptionsList! {
            let optionType = option["optionType"].string
            let defaultOption = option["defaultOption"].string
            
            let newOption = ReviewOption(optionType: optionType!, defaultOption: defaultOption!)
            
            optionsArray.append(newOption!)
        }
        
        return optionsArray
        
    }
    
    class func loadReviewOptions() -> [ReviewOption] {
        
        let url = Bundle.main.url(forResource: "sampleReviewOptions", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        let json = JSON(data: data)
        
        return reviewOptionsFromJson(json: json)
        
    }
    


}
