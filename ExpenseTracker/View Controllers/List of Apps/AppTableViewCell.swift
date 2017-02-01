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

    func setupWithApp(_ app: App) {
        // Takes the date from the app and presents it in the desired format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yy"
        let newDateAsString = dateFormatter.string(from: app.latestReleaseDate)
        
        nameLabel.text = app.appName
//        photoImageView.image = app.appIcon
        ratingControl.rating = app.currentVersionRating!
        dateLabel.text = newDateAsString
        
        // This is what I want to write
//        let appIconUrl = "http://is5.mzstatic.com/image/thumb/Purple71/v4/4b/ce/90/4bce9064-f2e6-a93e-8921-b4881b03a651/source/100x100bb.jpg"
        photoImageView.load_image(urlString: app.appIconUrl)
        
        

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

