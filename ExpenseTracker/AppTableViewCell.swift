//
//  AppTableViewCell.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 20/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class AppTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var dateLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupWithApp(_ app: App) {
        // Takes the date from the app and presents it in the desired format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yy"
        let newDateAsString = dateFormatter.string(from: app.date)
        
        nameLabel.text = app.name
        photoImageView.image = app.photo
        ratingControl.rating = app.rating
        dateLabel.text = newDateAsString

    }

}
