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
    let connectionApi: ConnectionApi
    
    init(card : Card) {
        self.card = card
        connectionApi = ConnectionApi()
    }
    
    var id : String {
        return "\(card.id)"
    }
    
    var image : UIImage? {

        let image : UIImage? = UIImage(named: "sampleImage")
        
        if let image = image {
            return image
        } else {
            return nil
        }
    }
    
    var job : String {
        return card.title
    }
    
    var jobDescription : String {
        return card.description
    }
    
    var price : String {
        return "$\(card.max_possible_earnings_hour)"
    }
    
    var timeDuration : String {
        return "\(card.start_time) - \(card.end_time)"
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
    
    func fetchImages(homeTableViewCell view : HomeTableViewCell , withCompletion completion : @escaping (Bool) -> ()) {
        //fetch image using image url
        // sample image for testing
        connectionApi.downloadImage(atUrl: card.photo) { (image) in
            view.imageView?.image = image
            completion(true)
        }
    }
}
