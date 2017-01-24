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

        // Configure the cell...
        
        let review = reviews[indexPath.row]
        
        cell.dateLabel.text = review.reviewDate
        cell.titleLabel.text = review.title
        cell.reviewLabel.text = review.review
        cell.ratingControl.rating = review.reviewRating
        
        cell.dateLabel.font = UIFont.systemFont(ofSize: 12)
        cell.titleLabel.font = UIFont.boldSystemFont(ofSize: 17)

        return cell
    }
    
    
    // MARK: Private Methods
    
    private func loadSampleReviews() {
        
        guard let review1 = Review(appName: "Coles", reviewDate: "1 Jan 2017", reviewRating: 5, title: "Awesome app!", review: "so amazing, would recommend to all my friends ") else {
            fatalError("Unable to instantiate review 1")
        }
        
        guard let review2 = Review(appName: "Coles", reviewDate: "13 Jan 2017", reviewRating: 1, title: "Crap", review: "where are the prices?") else {
            fatalError("Unable to instantiate review 2")
        }
        
        guard let review3 = Review(appName: "Coles", reviewDate: "22 Jan 2017", reviewRating: 4, title: "Great app", review: "Love the design, it's so much better than the old app.") else {
            fatalError("Unable to instantiate review 2")
        }

        reviews += [review1, review2, review3]
        
    }
    
    

}
