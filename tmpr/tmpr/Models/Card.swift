//
//  Card.swift
//  tmpr
//
//  Created by Frank Thamel on 17/10/2019.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation

struct Card : Codable {
    let id : Int
    let title : String
    let max_possible_earnings_hour : Float
    let description  : String
    let photo : String
    let currency : String
    let start_time : String
    let end_time : String
}

