//
//  Card.swift
//  tmpr
//
//  Created by Frank Thamel on 17/10/2019.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation


struct Card : Decodable {
    let id : String
    let imageUrl : String
    let job : String
    let jobDescription : String
    let price : Float
    let timeDuration : String
}
