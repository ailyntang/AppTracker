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
    }

    func setupWithApp(_ app: App) {
        // Takes the date from the app and presents it in the desired format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yy"
        let newDateAsString = dateFormatter.string(from: app.currentVersionReleaseDate)
        
        nameLabel.text = app.trackName
        photoImageView.load_image(urlString: app.artworkUrl60)
        ratingControl.rating = app.averageUserRatingForCurrentVersion!
        dateLabel.text = newDateAsString
        
    }
    

}

extension UIImageView {
    func load_image(urlString: String) {
        
        if let url = URL(string: urlString) {
            
            DispatchQueue.global(qos: .background).async {
                if let data = try? Data(contentsOf: url, options: NSData.ReadingOptions.uncached) {
                    
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)
                    }
                }
            }
            
        }
    }
}

