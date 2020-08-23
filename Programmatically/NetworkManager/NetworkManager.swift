//
//  NetworkManager.swift
//  Programmatically
//
//  Created by Satyadev Chauhan on 22/08/20.
//  Copyright © 2020 Satyadev Chauhan. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {

    /// Helper to perform request.
    ///
    /// - Parameters:
    ///   - url: URLConvertible.
    ///   - decoder: JSONDecoder for decoding.
    ///   - completion: Completion handler with Result<T, AFError>.
    @discardableResult
    class func performRequest<T: Decodable>(url: URLConvertible, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>) -> Void) -> DataRequest {
        return AF.request(url).responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
            completion(response.result)
        }
    }
    
    /// Helper to perform image request.
    ///
    /// - Parameters:
    ///   - url: URLConvertible.
    ///   - completion: Completion handler with AFDataResponse<Data>.
    @discardableResult
    class func performImageRequest(_ url: URLConvertible, completion: @escaping (AFDataResponse<Data>) -> Void) -> DataRequest {
        return AF.request(url).responseData(completionHandler: completion)
    }
    
}
