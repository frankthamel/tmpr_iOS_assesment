//
//  DataFetchService.swift
//  tmpr
//
//  Created by Frank Thamel on 17/10/2019.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation

class DataFetchService {
    class func fetchData() -> [Card] {
        // creating the dataset
        var dataset : [Card] = []
        let card = Card(id: "AA1", imageUrl: "url", job: "Test Job", jobDescription: "Test job description.", price: 14.00, timeDuration: "10.00 am - 02.00 pm")
        dataset.append(card)
        dataset.append(card)
        dataset.append(card)
        dataset.append(card)
        dataset.append(card)
        dataset.append(card)
        dataset.append(card)
        dataset.append(card)
        dataset.append(card)
        dataset.append(card)
        dataset.append(card)
        dataset.append(card)
        dataset.append(card)
        return dataset
    }
}
