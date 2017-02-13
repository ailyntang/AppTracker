//
//  AddAppTableViewCell.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 8/2/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class AddAppTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func returnSearchResults(_ app: App) {
        nameLabel.text = app.trackName
        photoImageView.load_image(urlString: app.artworkUrl60)
//        descriptionLabel = 
        // appManager.myNumber = 5
    }
    

}
