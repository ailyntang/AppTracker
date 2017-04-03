//
//  Review.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 23/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//
import Foundation
import SwiftyJSON

class Review {
    
    // MARK: Properties
    
    var appName: String
    var reviewDate: Date
    var reviewRating: Double    // can't be Int as ReviewControl expects Double
    var reviewTitle: String?
    var reviewInFull: String?
    
    
    // MARK: Initialization
    
    init?(appName: String, reviewDate: String, reviewRating: Double, reviewTitle: String?, reviewInFull: String?) {
    
        let unwrappedReviewTitle = reviewTitle ?? ""
        let unwrappedReviewInFull = reviewInFull ?? ""
        
        
        // Initialization should fail if the following occurs
        if appName.isEmpty || reviewRating < 0 || fmod(reviewRating, 1) != 0 {
            return nil
        }
    
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        
        // Initialize stored properties
        self.appName = appName
        self.reviewDate = dateFormatter.date(from: reviewDate)!
        self.reviewRating = reviewRating
        self.reviewTitle = unwrappedReviewTitle
        self.reviewInFull = unwrappedReviewInFull
    }
    
    
    // MARK: Functions
    
    class func reviewsFromJson(json: JSON) -> [Review] {
        var reviews: [Review] = []
        
        if let reviewList = json["reviews"].array {
            for review in reviewList {
                let appName = review["appName"].string
                let reviewDate = review["reviewDate"].string
                let reviewRating = review["reviewRating"].double
                let reviewTitle = review["title"].string
                let reviewInFull = review["review"].string
                
                let newReview = Review(appName: appName!, reviewDate: reviewDate!, reviewRating: reviewRating!, reviewTitle: reviewTitle, reviewInFull: reviewInFull)
                
                reviews.append(newReview!)
            }
        }
        
        return reviews
    }
    
    
    class func loadSampleReviews() -> [Review] {
        
        let url = Bundle.main.url(forResource: "sampleReviews", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let json = JSON(data: data)
        
        return reviewsFromJson(json: json)
        
    }
    
    
    
}
