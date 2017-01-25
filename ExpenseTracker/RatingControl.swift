//
//  RatingControl.swift
//  ExpenseTracker
//
//  Created by Ai-Lyn Tang on 20/1/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    
    // MARK: Properties
    private var ratingImages = [UIImageView]()
    var rating = 2.0

    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    
    // MARK: Private Methods
    private func setupButtons() {
        
        // Clear any existing images
        for image in ratingImages {
            removeArrangedSubview(image)
            image.removeFromSuperview()
        }
        ratingImages.removeAll()
        
        // Load button images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let halfStar = UIImage(named: "halfStar", in: bundle, compatibleWith: self.traitCollection)

        
        for index in 0..<5 {

            var image = UIImageView()
            
            // Fill in full, half or empty stars according to the rating
            if Double(index) < (rating - 1) {
                image = UIImageView(image: filledStar)
            } else if (Double(index) < rating) && (fmod(rating, 1) != 0) {
                image = UIImageView(image: halfStar)
            } else if (Double(index) < rating) && (fmod(rating, 1) == 0) {
                image = UIImageView(image: filledStar)
            } else {
                image = UIImageView(image: emptyStar)
            }
            
            // Add the image to the stack
            addArrangedSubview(image)
            
            // Add the new image to the rating image array
            ratingImages.append(image)
        }
    }
    
}


/*
// This code all works
class RatingControl: UIStackView {
    
    // MARK: Properties
    private var ratingButtons = [UIButton]()
    
    // Critical, don't delete. If I comment out this section, then the stars are all empty stars
    var rating = 0.0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    
    // MARK: Private Methods
    private func setupButtons() {
        
        // Clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load button images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        //        let halfStar = UIImage(named: "halfStar", in: bundle, compatibleWith: self.traitCollection)
        
        
        
        
        for _ in 0..<5 {
            // Create the button
            let button = UIButton()
            
            // Set button images
            button.setImage(emptyStar, for: .normal)
            //            button.setImage(filledStar, for: .selected)
            
            // Determine half star vs filled star
            // % doesn't work for double
            if fmod(rating, 1) == 0 {
                button.setImage(filledStar, for: .selected)
                
            }
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
        
        updateButtonSelectionStates()
    }
    
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = Double(index) < rating
        }
    }
    
}
*/
