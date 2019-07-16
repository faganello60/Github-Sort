//
//  NetworkResponse.swift
//  github-starts
//
//  Created by Bruno Faganello Neto on 05/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import UIKit

enum NetworkResponse:String,Error {
    case success
    case noUserSalesForce
    case tokenExpired
    
    case noConnection = "No connection"
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

extension NetworkResponse: Equatable {
    static func == (lhs: NetworkResponse, rhs: NetworkResponse) -> Bool {
            return lhs.rawValue == rhs.rawValue
    }
}
