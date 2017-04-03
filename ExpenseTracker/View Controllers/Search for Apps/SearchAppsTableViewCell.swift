//
//  SearchAppsTableViewCell.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 14/2/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class SearchAppsTableViewCell: UITableViewCell {
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCellWith(app: AppFromSearchApi) {
        artworkImageView.load_image(urlString: app.artworkUrl60)
        trackNameLabel!.text = app.trackName
        descriptionLabel!.text = app.description
    }
    
}
