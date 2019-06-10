//
//  NetworkRouter.swift
//  github-starts
//
//  Created by Bruno Faganello Neto on 05/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import UIKit

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: class {
    associatedtype EndPoint:EndPointType
    func request(_ route:EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
