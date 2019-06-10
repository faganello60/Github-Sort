//
//  DecoderResponse.swift
//  github-starts
//
//  Created by Bruno Faganello Neto on 05/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import UIKit

enum DecodeResult<T> {
    case success(T)
    case failure(NetworkResponse)
}

class DecoderResponse: NSObject {
    
    func decodeResponser<T>(data:Data?,response:URLResponse?,error:Error?) -> DecodeResult<T> where T : Decodable {
        if let _ = error {
            return .failure(NetworkResponse.noConnection)
        }
        
        guard let response = response else {
            return .failure(NetworkResponse.noData)
        }

        let result = NetworkResponseManager.handleNetworkResponse(response)

        switch result {
        case .success:
            guard let responseData = data else {
                return .failure(NetworkResponse.unableToDecode)
            }

            do {
                let obj = try JSONDecoder().decode(T.self, from: responseData)
               return .success(obj)
            } catch {
                debugPrint(error)
                return .failure(NetworkResponse.unableToDecode)
            }

        case .failure(let netWorkError):
            return .failure(netWorkError)
        }
    }
}
