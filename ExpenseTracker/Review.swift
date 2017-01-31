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
    
    var appName: String
    var reviewDate: Date
    var reviewRating: Double    // can't be Int as ReviewControl expects Double
    var title: String
    var review: String
    
    
    
    // MARK: Initialization
    
    init?(appName: String, reviewDate: String, reviewRating: Double, title: String, review: String) {
    
        // Initialization should fail if there is no name or the rating is negative
        if appName.isEmpty || reviewRating < 0 || fmod(reviewRating, 1) != 0 {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        
        // Initialize stored properties
        self.appName = appName
        self.reviewDate = dateFormatter.date(from: reviewDate)!
        self.reviewRating = reviewRating
        self.title = title
        self.review = review
    }
    
    
    class func loadSampleReviews() -> [Review] {
        
        var reviews: [Review] = []
        
        // Fetch URL
        let url = Bundle.main.url(forResource: "sampleReviews", withExtension: "json")!
        
        // Load data
        let data = try! Data(contentsOf: url)
        
        // Deserialize JSON
        let topLevelDictionary = try! JSONSerialization.jsonObject(with: data, options:[]) as! NSDictionary
        
        let reviewList = topLevelDictionary["reviews"] as! NSArray
        
        
        // Convert the data into an array of Reviews
        for anyReview in reviewList {
            let reviewDictionary = anyReview as! NSDictionary
            
            let appName = reviewDictionary["appName"] as? String
            let reviewDate = reviewDictionary["reviewDate"] as? String
            let reviewRating = reviewDictionary["reviewRating"] as? Double
            let title = reviewDictionary["title"] as? String
            let review = reviewDictionary["review"] as? String
            
            let myReview = Review(appName: appName!, reviewDate: reviewDate!, reviewRating: reviewRating!, title: title!, review: review!)
            
            reviews.append(myReview!)
        }
        
        return reviews
    }
    
    
}
