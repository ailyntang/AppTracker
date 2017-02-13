//
//  SearchAppsTableViewCell.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 13/2/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class SearchAppsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    /// This function will configure a cell to display highlighted text where string matches have been found. It creates a regular expression out of `searchTerm`, enumerates through the default `cellText` to find matches, applies background colour to an `NSMutableAttributedString` copy of `cellText`, and then sets the attributedText of the cell's textLabel. If there is no match, or an error occurs with the regular expression, the provided `cellText` is used as is.
    /// - parameter searchTerm: `String`, the text the user has entered as a search term.
    /// - parameter cellText: `String`, the text to use if there is an error with the regular expression.
    
    func configureCellWith(searchTerm:String, cellText:String)
    {
        // Create a regEx pattern
        var pattern = searchTerm.replacingOccurrences(of: " ", with: "|")
        pattern.insert("(", at: pattern.startIndex)
        pattern.insert(")", at: pattern.endIndex)
        
        do {
            let regEx = try NSRegularExpression(pattern: pattern, options: [.caseInsensitive, .allowCommentsAndWhitespace])
            let range = NSRange(location: 0, length: cellText.characters.count)
            let displayString = NSMutableAttributedString(string: cellText)
            let highlightColour = UIColor(colorLiteralRed: 124/255.0, green: 215/255.0, blue: 204/255.0, alpha: 0.5)
            
            regEx.enumerateMatches(in: cellText, options: .withTransparentBounds, range: range, using: { (result, flags, stop) in
                
                if result?.range != nil
                {
                    displayString.setAttributes([NSBackgroundColorAttributeName:highlightColour], range: result!.range)
                }
                
            })
            
            self.textLabel?.attributedText = displayString
            
        } catch
        {
            self.textLabel?.text = cellText
        }
    }

}
