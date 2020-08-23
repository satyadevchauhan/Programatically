//
//  ListEndPoint.swift
//  Programmatically
//
//  Created by Satyadev Chauhan on 22/08/20.
//  Copyright © 2020 Satyadev Chauhan. All rights reserved.
//

import Alamofire

class ListEndPoint {
    
    /// Helper to get list data with completion.
    static func getList(completion:@escaping (Result<[ItemModel], AFError>) -> Void) {
        let url = "https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json"
        NetworkManager.performRequest(url: url, completion: completion)
    }

}
