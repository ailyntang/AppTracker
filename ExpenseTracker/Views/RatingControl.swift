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
    
    // An alternative to using "didSet" is to call refreshImages from the cell setup in each ViewController
    // didSet is great for simple things, but can get confusing to debug if there are mutiple inputs required
    var rating = 0.0 {
        didSet {
            refreshImages()            
        }
    }

    
    // MARK: Initialization
    
    // Used when setting up RatingControl from the storyboard
    override init(frame: CGRect) {
        super.init(frame: frame)
        refreshImages()
    }
    
    // Used when setting up RatingControl with code (which is what we are doing)
    required init(coder: NSCoder) {
        super.init(coder: coder)
        refreshImages()
    }
    
    
    // MARK: Private Methods
    func refreshImages() {
        
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

            var image: UIImage? = nil
            
            // Fill in full, half or empty stars according to the rating
            let doubleIndex = Double(index)
            let modRating = fmod(rating, 1)
            
            if doubleIndex < (rating - 1) {
                image = filledStar
            } else if (doubleIndex < rating) && (modRating != 0) {
                image = halfStar
            } else if (doubleIndex < rating) && (modRating == 0) {
                image = filledStar
            } else {
                image = emptyStar
            }
            
            let imageView = UIImageView(image: image)
            
            // Add the image to the stack
            addArrangedSubview(imageView)
            
            // Add the new image to the rating image array
            ratingImages.append(imageView)
        }
    }
    
}
