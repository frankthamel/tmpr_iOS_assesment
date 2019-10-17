//
//  CardListViewModel.swift
//  tmpr
//
//  Created by Frank Thamel on 17/10/2019.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation
import UIKit

struct CardListViewModel {
    let cards : [Card]
    let cardsViewModel : [CardViewModel]
    
    init(_ cards : [Card])
    {
        self.cards = cards
        self.cardsViewModel = cards.map{CardViewModel(card: $0)}
    }
}

extension CardListViewModel {
    
    func cardAt(_ index: Int) -> CardViewModel {
        return self.cardsViewModel[index]
    }
}
