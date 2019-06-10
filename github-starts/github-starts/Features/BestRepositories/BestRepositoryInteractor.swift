//
//  BestRepositoryInteractor.swift
//  github-starts
//
//  Created Bruno Faganello Neto on 07/06/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class BestRepositoryInteractor {
    
    //--------------------------------------------------
    // MARK: - Private Properties
    //--------------------------------------------------
    
    private let requestManager: GithubManager
    
    //--------------------------------------------------
    // MARK: - Viper Module Properties
    //--------------------------------------------------
    
    weak var output: BestRepositoryInteractorOutputProtocol!
    
    //--------------------------------------------------
    // MARK: - Initialization
    //--------------------------------------------------
    
    init(requestManager: GithubManager = GithubManager()) {
        self.requestManager = requestManager
    }
}

//--------------------------------------------------
// MARK: - BestRepositoryInteractorInputProtocol
//--------------------------------------------------

extension BestRepositoryInteractor: BestRepositoryInteractorInputProtocol {
    func requestBestRepositories(with language: GithubManager.Language, sorted: GithubManager.Sort, page: Int) {
        requestManager.searchRepositories(with: language,
                                          sorted: sorted,
                                          page: page,
                                          successHandler: { searchInfo in
                                            self.output.didRecivedRepositories(searchInfo.items)
                                          },
                                          errorHandler: { error in
                                            self.output.didRecivedError(error)
                                          }
        )
    }
}
