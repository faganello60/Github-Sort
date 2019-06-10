//
//  BestRepositoryCellViewModel.swift
//  github-starts
//
//  Created by Bruno Faganello Neto on 07/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import UIKit

struct BestRepositoryCellViewModel: BestRepositoryCellRepresentable {
    
    var repositoryName: String
    var repositoryStars: String
    var ownerName: String
    var ownerPictureURL: String
    
    init(repository:Repository) {
        repositoryName = repository.name
        repositoryStars = String(describing: repository.startsCount)
        ownerName = repository.owner.name
        ownerPictureURL = repository.owner.pictureUrl
    }
    
    init() {
        repositoryName = ""
        repositoryStars = ""
        ownerName = ""
        ownerPictureURL = ""
    }
}
