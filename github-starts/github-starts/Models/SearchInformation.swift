//
//  SearchInformation.swift
//  github-starts
//
//  Created by Bruno Faganello Neto on 06/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import UIKit

struct SearchInformation: Codable {
    let items:[Repository]
    
    private enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}
