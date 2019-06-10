//
//  NetworkResponseManager.swift
//  github-starts
//
//  Created by Bruno Faganello Neto on 05/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import UIKit

enum Result<T> {
    case success
    case failure(NetworkResponse)
}

extension Result where T: Equatable {
    static func == (lhs: Result<T>, rhs: Result<T>) -> Bool {
        switch (lhs, rhs) {
        case (.success,.success):
            return true
        case (.failure(let lValue), .failure(let rValue)):
            return lValue == rValue
        default:
            return false
        }
    }
}

class NetworkResponseManager {
    class func handleNetworkResponse(_ response: URLResponse) -> Result<NetworkResponse> {
        if let httpResponse = response as? HTTPURLResponse {
            switch httpResponse.statusCode {
            case 200...299: return .success
            case 401...500: return .failure(NetworkResponse.authenticationError)
            case 501...599: return .failure(NetworkResponse.badRequest)
            case 600:       return .failure(NetworkResponse.outdated)
            default:        return .failure(NetworkResponse.failed)
            }
        } else {
            return .success
        }
    }
}
