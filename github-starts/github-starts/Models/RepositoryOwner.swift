//
//  RepositoryOwner.swift
//  github-starts
//
//  Created by Bruno Faganello Neto on 06/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import UIKit

struct RepositoryOwner: Codable {
    let name:String
    let pictureUrl:String
    
    private enum CodingKeys: String, CodingKey {
        case name = "login"
        case pictureUrl = "avatar_url"
    }
}
