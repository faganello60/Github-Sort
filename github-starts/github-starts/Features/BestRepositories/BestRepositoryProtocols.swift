//
//  BestRepositoryProtocols.swift
//  github-starts
//
//  Created Bruno Faganello Neto on 07/06/19.
//  Copyright © 2019. All rights reserved.
//

import Foundation
import UIKit


//--------------------------------------------------
// MARK: - Router
//--------------------------------------------------

protocol BestRepositoryWireframeProtocol: class {
    
}

//--------------------------------------------------
// MARK: - Interactor
//--------------------------------------------------

protocol BestRepositoryInteractorInputProtocol {
    func requestBestRepositories(with language: GithubManager.Language,
                                 sorted: GithubManager.Sort,
                                 page: Int)
}

//--------------------------------------------------
// MARK: - Presenter
//--------------------------------------------------

protocol BestRepositoryPresenterInputProtocol: class {
    func updateRepositories()
    func refreshRepositories()
    func modelFromIndexPath(_ indexPath: IndexPath) -> BestRepositoryCellRepresentable
    func showNextPageIfNeeded(offsetY: CGFloat, contentHeight: CGFloat, scrollViewHeight: CGFloat)
    
    var numberOfRow: Int {get }
}

protocol BestRepositoryInteractorOutputProtocol: class {
    func didRecivedRepositories(_ repositories: [Repository])
    func didRecivedError(_ error: Error)
}

//--------------------------------------------------
// MARK: - View
//--------------------------------------------------

protocol BestRepositoryPresenterOutputProtocol: class {
    func reloadTableView()
    func viewShowError(title: String, message:String)
}
