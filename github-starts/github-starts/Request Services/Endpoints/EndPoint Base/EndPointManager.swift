//
//  EndPointManager.swift
//  github-starts
//
//  Created by Bruno Faganello Neto on 05/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import UIKit

protocol EndPointManager {
    associatedtype T:EndPointType
    var router:Router<T> { get }    
}

extension EndPointManager {
    var router:Router<Self.T> {
        return Router<Self.T>()
    }
}
