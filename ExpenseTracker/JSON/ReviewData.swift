//
//  ReviewData.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 30/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation

struct ReviewData {
    let appName: String
    let reviewDate: String
    let reviewRating: Double
    let title: String
    let review: String
    
    init(appName: String, reviewDate: String, reviewRating: Double, title: String, review: String) {
        self.appName = appName
        self.reviewDate = reviewDate
        self.reviewRating = reviewRating
        self.title = title
        self.review = review
    }
    
}


extension ReviewData: JSONDecodable {
    init(decoder: JSONDecoder) throws {
        self.appName = try decoder.decode(key: "appName")
        self.reviewDate = try decoder.decode(key: "reviewData")
        self.reviewRating = try decoder.decode(key: "reviewRating")
        self.title = try decoder.decode(key: "title")
        self.review = try decoder.decode(key: "review")
    }
}
