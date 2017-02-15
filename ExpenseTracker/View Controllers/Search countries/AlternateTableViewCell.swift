//
//  AlternateTableViewCell.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 13/2/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class AlternateTableViewCell: UITableViewCell {
    @IBOutlet weak var hugeCountryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(countryName: String)
    {
        hugeCountryLabel.text = countryName
    }
    
}
