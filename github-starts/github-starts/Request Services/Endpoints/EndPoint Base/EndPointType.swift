//
//  EndPointType.swift
//  github-starts
//
//  Created by Bruno Faganello Neto on 05/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import UIKit

public typealias CompletionHandler = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol EndPointType {
    var baseURL:URL { get }
    var path:String { get }
    var task:HTTPTask { get }
    var httpMethod:HTTPMethod { get }
    var headers:HTTPHeaders? { get }
}

extension EndPointType {    
    var headers:HTTPHeaders? {
        return nil
    }
}
