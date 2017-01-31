//
//  App.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 23/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class App {
    
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Double
    var date: Date
    
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Double, date: String) {
        
        // Initialization should fail if there is no name or if the rating is negative
        if name.isEmpty || rating < 0 {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        // In the future when reading from the iTunes search API, the dateFormat will be:
        // dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.dateFormat = "dd MMM yyyy"
        
        // Initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
        self.date = dateFormatter.date(from: date)!
    }
    
}
