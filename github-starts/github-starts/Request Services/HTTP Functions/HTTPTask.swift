//
//  HTTPTask.swift
//  github-starts
//
//  Created by Bruno Faganello Neto on 05/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import UIKit

public typealias HTTPHeaders = [String:String]
public typealias Parameters = [String:Any]

public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters:Parameters?,
                           urlParameters:Parameters?)
    
    case requestParametersAndHeader(bodyParameters:Parameters?,
                                    urlParameters:Parameters?,
                                    additionalHeader:HTTPHeaders?)
}
