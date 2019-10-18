//
//  DataFetchService.swift
//  tmpr
//
//  Created by Frank Thamel on 17/10/2019.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation
import SwiftyJSON

class DataFetchService {
    class func fetchCards(withCompletion completion :  @escaping (_ result: [Card])->()) {

        var cards : [Card] = []

        let connectionApi = ConnectionApi(url: "https://temper.works/api/v1/contractor/shifts", httpMethod: .get)
        connectionApi.addParameter(value: "2019-10-19", forKey: "dates" )

        connectionApi.performRequest { response in
            if let data = response {
                let json = try? JSON(data: data)
                if let json = json {
                    print("\(json["data"]["2019-10-19"])")
                    
                    for (_,subJson):(String, JSON) in json["data"]["2019-10-19"] {
                    
                        let id = subJson["id"].intValue
                        let title = subJson["title"].stringValue
                        let max_possible_earnings_hour = subJson["max_possible_earnings_hour"].floatValue
                        
                        guard let description = subJson["job_category"]["description"].rawString() else {return}
                        
                        let photo = subJson["photo"].stringValue
                        
                        guard let currency = subJson["shifts"][0]["currency"].rawString() else {return}
                       
                        guard let start_time = subJson["shifts"][0]["start_time"].rawString() else {return}
                        
                        guard let end_time = subJson["shifts"][0]["end_time"].rawString() else {return}
                        
                        let card = Card(id: id, title: title, max_possible_earnings_hour: max_possible_earnings_hour, description: description, photo: photo, currency: currency, start_time: start_time, end_time: end_time)
                        
                        cards.append(card)
                    }
                    
                    completion(cards)
            
                }
            }
        }
    }
}
