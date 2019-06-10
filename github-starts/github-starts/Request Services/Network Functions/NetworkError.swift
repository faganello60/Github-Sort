//
//  NetworkError.swift
//  github-starts
//
//  Created by Bruno Faganello Neto on 05/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import UIKit

public enum NetworkError : String, Error, Equatable {

    case parametersNil = "Parameters are nil"
    case encodingFailed = "Encode Fail"
    case missingURL = "Missing URL"

    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }

}
