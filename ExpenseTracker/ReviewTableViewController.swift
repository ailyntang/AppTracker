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

    
    // This "works", but it's just me playing around.
//    private func readJSONObject(object: [String: AnyObject]) {
//        guard let reviews = object["reviews"] as? [[String: AnyObject]] else {
//            fatalError("Issue with readJSONObject")
//        }
//        
//        for review in reviews {
//            guard let appName = review["appName"] as? String,
//                let review = review["review"] as? String else {
//                    fatalError("Issue inside the for loop in readJSONObject")
//            }
//        }
//    }
    
    private func loadSampleReviews() {
        
        // This "works", but it's just me playing around with it
//        let url = Bundle.main.url(forResource: "sampleReviews", withExtension: "json")
//        let data = NSData(contentsOf: url!)
//        
//        do {
//            let object = try JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments)
//            if let dictionary = object as? [String: AnyObject] {
//                print("inside the dictionary bit: \(dictionary)")
//            }
//        } catch {
//            fatalError("Some issue with sampleReviews.json")
//        }
        
        
        
        // All of this code works
        // Trying to replace it with a JSON file now
        guard let review1 = Review(appName: "Coles", reviewDate: "01 Jan 2017", reviewRating: 5, title: "Awesome app!", review: "so amazing, would recommend to all my friends ") else {
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
