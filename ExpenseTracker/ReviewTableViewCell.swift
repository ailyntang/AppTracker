//
//  ReviewTableViewCell.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 23/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var ratingControl: RatingControl!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    func setupReviewCell(_ review: Review) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let newDateString = dateFormatter.string(from: review.reviewDate)
        
        
        // Linking the cell contents to the correct data
        dateLabel.text = newDateString
        titleLabel.text = review.title
        reviewLabel.text = review.review
        ratingControl.rating = review.reviewRating
        
        
        // Formatting the fonts of certain labels
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
    }
}
