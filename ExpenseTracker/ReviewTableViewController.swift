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
        
        
        // Converting the date from the iTunes Search API into a string
        let dateFormatter = DateFormatter()
        let dateAsString = review.reviewDate
        dateFormatter.dateFormat = "dd MMM yyyy"
        
        guard let newDate = dateFormatter.date(from: dateAsString) else {
            fatalError("The review date from the iTunes Search API is not in the expected date format")
        }
        
        dateFormatter.dateFormat = "EEEE"
        let newDateString = dateFormatter.string(from: newDate)
        
        
        // Linking the cell contents to the correct data
        cell.dateLabel.text = newDateString
        cell.titleLabel.text = review.title
        cell.reviewLabel.text = review.review
        cell.ratingControl.rating = review.reviewRating
        

        // Formatting the fonts of certain labels
        cell.dateLabel.font = UIFont.systemFont(ofSize: 12)
        cell.titleLabel.font = UIFont.boldSystemFont(ofSize: 17)

        return cell
    }
    
    
    // MARK: Private Methods
    
    private func loadSampleReviews() {

        /*********************************************************
        ********** Attempts to fetch data from JSON file *********
        **********************************************************
        */
        
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
