//
//  CardViewModel.swift
//  tmpr
//
//  Created by Frank Thamel on 17/10/2019.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation
import UIKit

struct CardViewModel {
    
    let card : Card!
    
    init(card : Card) {
        self.card = card
    }
    
    var id : String {
        return card.id
    }
    
    var image : UIImage? {
        //fetch image using image url
        // sample image for testing
        let image : UIImage? = UIImage(named: "sampleImage")
        
        if let image = image {
            return image
        } else {
            return nil
        }
    }
    
    var job : String {
        return card.job
    }
    
    var jobDescription : String {
        return card.jobDescription
    }
    
    var price : String {
        return "$\(card.price)"
    }
    
    var timeDuration : String {
        return card.timeDuration
    }
}

// configure View
extension CardViewModel {
    func configure(homeTableViewCell view : HomeTableViewCell ) {
        //view.imageView!.image = image
        view.jobLabel.text = job
        view.jobDescriptionLabel.text = jobDescription
        view.jobTimePeriod.text = timeDuration
        view.priceLabel.text = price
        view.layoutSubviews()
    }
}
