//
//  Review.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 23/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class Review {
    
    // MARK: Properties
    
    var app: App
    var reviewDate: String
    var reviewRating: Int
    var title: String
    var review: String
    
    
    // MARK: Initialization
    
    init?(app: App, reviewDate: String, reviewRating: Int, title: String, review: String) {
    
        // Initialization should fail if there is no name or the rating is negative
        if app.name.isEmpty || reviewRating < 0 {
            return nil
        }
        
        // Initialize stored properties
        self.app = app
        self.reviewDate = reviewDate
        self.reviewRating = reviewRating
        self.title = title
        self.review = review
    }
    
}
