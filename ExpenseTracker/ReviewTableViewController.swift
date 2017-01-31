//
//  ReviewTableViewController.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 23/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class ReviewTableViewController: UITableViewController {

    let cellIdentifier = "ReviewTableViewCell"
    var reviews: [Review] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleReviews()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ReviewTableViewCell else {
            fatalError("The dequeued cell is not an instance of ReviewTableViewCell")
        }

        let review = reviews[indexPath.row]
        cell.setupReviewCell(review)
        return cell
        
    }
    
    
    // MARK: Private Methods
    
    private func loadSampleReviews() {

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

        
    }
    
    

}
