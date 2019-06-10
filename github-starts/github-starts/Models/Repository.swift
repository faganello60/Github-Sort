//
//  Repository.swift
//  github-starts
//
//  Created by Bruno Faganello Neto on 06/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import UIKit

struct Repository: Codable {
    let startsCount: Int
    let name: String
    let owner: RepositoryOwner
    
    private enum CodingKeys: String, CodingKey {
        case startsCount = "stargazers_count"
        case name = "name"
        case owner = "owner"
    }
}
