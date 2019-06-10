//
//  BestRepositoryPresenter.swift
//  github-starts
//
//  Created Bruno Faganello Neto on 07/06/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class BestRepositoryPresenter {
    
    //--------------------------------------------------
    // MARK: - Private Properties
    //--------------------------------------------------
    
    private var nextPage:Int
    private var repositories = [Repository]()
    private var isFetching = false
    
    //--------------------------------------------------
    // MARK: - Viper Module Properties
    //--------------------------------------------------

    weak var view: BestRepositoryPresenterOutputProtocol!
    var interactor: BestRepositoryInteractorInputProtocol!
    var wireframe: BestRepositoryWireframeProtocol!
    
    
    init() {
        nextPage = 1
    }
    
    //--------------------------------------------------
    // MARK: - Private Methods
    //--------------------------------------------------
}

//--------------------------------------------------
// MARK: - BestRepositoryPresenterInputProtocol
//--------------------------------------------------

extension BestRepositoryPresenter: BestRepositoryPresenterInputProtocol {
    
    func showNextPageIfNeeded(offsetY: CGFloat, contentHeight: CGFloat, scrollViewHeight: CGFloat) {
        if offsetY > contentHeight - scrollViewHeight {
            if !isFetching {
                isFetching = true
                interactor.requestBestRepositories(with: .swift, sorted: .stars, page: nextPage)
            }
        }
    }
    
    func refreshRepositories() {
        nextPage = 1
        repositories = []
        isFetching = true
        interactor.requestBestRepositories(with: .swift, sorted: .stars, page: nextPage)
    }
    
    func updateRepositories() {
        isFetching = true
        interactor.requestBestRepositories(with: .swift, sorted: .stars, page: nextPage)
    }
    
    func modelFromIndexPath(_ indexPath: IndexPath) -> BestRepositoryCellRepresentable {
        if indexPath.row > repositories.count {
            return BestRepositoryCellViewModel()
        }
        return BestRepositoryCellViewModel(repository: repositories[indexPath.row])
    }
    
    var numberOfRow: Int {
        return repositories.count
    }
}

//--------------------------------------------------
// MARK: - BestRepositoryPresenterInputProtocol
//--------------------------------------------------

extension BestRepositoryPresenter: BestRepositoryInteractorOutputProtocol {
    func didRecivedRepositories(_ repositories: [Repository]) {
        self.repositories.append(contentsOf: repositories)
        nextPage += 1
        isFetching = false
        view.reloadTableView()
    }
    
    func didRecivedError(_ error: Error) {
        isFetching = false
        view.viewShowError(title: "Problemas na conexão", message: "Tente novamente")
    }
}
