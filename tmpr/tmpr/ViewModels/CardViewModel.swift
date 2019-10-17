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
    
    var image : UIImage {
        print(card.imageUrl)
        //fetch image using image url
        return UIImage()
    }
    
    var job : String {
        return card.job
    }
    
    var jobDescription : String {
        return card.jobDescription
    }
    
    var price : Float {
        return card.price
    }
    
    var timeDuration : String {
        return card.timeDuration
    }
}

// configure View
extension CardViewModel {
    func configure(homeTableViewCell view : HomeTableViewCell ) {
        
    }
}
