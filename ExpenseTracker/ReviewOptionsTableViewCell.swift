//
//  ReviewOptionsTableViewCell.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 27/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class ReviewOptionsTableViewCell: UITableViewCell {
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var settingButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
