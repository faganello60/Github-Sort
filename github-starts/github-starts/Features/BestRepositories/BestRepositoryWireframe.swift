//
//  BestRepositoryWireframe.swift
//  github-starts
//
//  Created Bruno Faganello Neto on 07/06/19.
//  Copyright © 2019 XPInvestimentos. All rights reserved.
//

import UIKit

class BestRepositoryWireframe {

    //--------------------------------------------------
    // MARK: - Constants
    //--------------------------------------------------

	private let storyBoardName = "BestRepository"
	private let viewIdentifier = "BestRepositoryView"

    //--------------------------------------------------
    // MARK: - Viper Module Properties
    //--------------------------------------------------

	weak var view: BestRepositoryView!

    //--------------------------------------------------
    // MARK: - Initialization
    //--------------------------------------------------

    init() {
        let view = self.viewControllerFromStoryboard()
        let interactor = BestRepositoryInteractor()
        let presenter = BestRepositoryPresenter()

        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = view

        view.presenter = presenter
        interactor.output = presenter

        self.view = view
	}

    //--------------------------------------------------
    // MARK: - Private Methods
    //--------------------------------------------------

	private func viewControllerFromStoryboard() -> BestRepositoryView {
		let storyboard = UIStoryboard(name: self.storyBoardName, bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: self.viewIdentifier)

		return viewController as! BestRepositoryView
	}

}

//--------------------------------------------------
// MARK: - BestRepositoryWireframeProtocol
//--------------------------------------------------

extension BestRepositoryWireframe: BestRepositoryWireframeProtocol {
    
}
