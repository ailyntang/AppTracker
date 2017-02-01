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
}
