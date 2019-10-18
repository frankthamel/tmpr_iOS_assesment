//
//  ConnectionApi.swift
//  tmpr
//
//  Created by Frank Thamel on 17/10/2019.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class ConnectionApi {
    
    enum CustomError : Error {
        case invalidURLString
    }
    
    // request url
    let url : String?
    let httpMethod : HTTPMethod?
    var headers : [String : String]
    var body : [String : String]
    var parameters : [String:String]
    
    init(url : String , httpMethod : HTTPMethod) {
        self.url = url
        self.httpMethod = httpMethod
        headers = [String:String]()
        body = [String:String]()
        parameters = [String : String]()
    }
    
    init() {
        self.url = nil
        self.httpMethod = nil
        headers = [String:String]()
        body = [String:String]()
        parameters = [String : String]()
    }
   
    func addHeader(value : String, forKey key : String)
    {
        headers[key] = value
    }
    
    func addBody(value : String, forKey key : String)
    {
        body[key] = value
    }
    
    func addParameter(value : String, forKey key : String)
    {
        parameters[key] = value
    }

    
    func performRequest(withCompletion completion: @escaping (Data?) -> Void) {
        
        guard let url = url, let httpMethod = httpMethod else {
            return
        }
        
        if headers.count > 0 {
             Alamofire.request(url, method: httpMethod, parameters: parameters, encoding:URLEncoding.default , headers: headers)
                   .validate()
                   .responseJSON { response in
                     guard response.result.isSuccess else {
                       print("Error while fetching remote data: \(String(describing: response.result.error))")
                       completion(nil)
                       return
                     }
                    completion(response.data)
                   }
        } else {
            Alamofire.request(url,method: httpMethod ,parameters: parameters)
            .validate()
            .responseJSON { response in
              guard response.result.isSuccess else {
                print("Error while fetching remote data: \(String(describing: response.result.error))")
                completion(nil)
                return
              }
                completion(response.data)
            }
        }
    }
    
    func downloadImage(atUrl url: String, withCompletion completion: @escaping (UIImage?) -> Void) {
        // Download image
        // pass image path in completion
        
        Alamofire.request(url).responseImage { response in
            if let image = response.result.value {
                print("image downloaded: \(image)")
                completion(image)
            }
        }
    }
    
}
