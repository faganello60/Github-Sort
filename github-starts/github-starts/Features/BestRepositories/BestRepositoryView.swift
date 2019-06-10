//
//  BestRepositoryView.swift
//  github-starts
//
//  Created Bruno Faganello Neto on 07/06/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class BestRepositoryView: UIViewController {

    //--------------------------------------------------
    // MARK: - Outlets
    //--------------------------------------------------
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(BestRepositoryCell.self)
            configureRefreshControl()
        }
    }
    
    private let refreshControl = UIRefreshControl()
    
    //--------------------------------------------------
    // MARK: - Viper Module Properties
    //--------------------------------------------------

	var presenter: BestRepositoryPresenterInputProtocol!

    //--------------------------------------------------
    // MARK: - Override methods
    //--------------------------------------------------

	override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Best of Swift"
        presenter.updateRepositories()
    }
    
    //--------------------------------------------------
    // MARK: - Private Methods
    //--------------------------------------------------

    @objc private func refreshData(_ sender: Any) {
        presenter.refreshRepositories()
    }
    
    private func stopRefreshing() {
        refreshControl.endRefreshing()
    }
    
    private func configureRefreshControl() {
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
    }
}

//--------------------------------------------------
// MARK: - BestRepositoryPresenterOutputProtocol
//--------------------------------------------------

extension BestRepositoryView: BestRepositoryPresenterOutputProtocol {
    func viewShowError(title: String, message: String) {
        stopRefreshing()
        showError(title: title, message: message) { _ in
            self.presenter.updateRepositories()
        }
    }
    
    func reloadTableView() {
        stopRefreshing()
        tableView.reloadData()
    }
}

//--------------------------------------------------
// MARK: - UITableViewDataSource
//--------------------------------------------------

extension BestRepositoryView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as BestRepositoryCell
        let model = presenter.modelFromIndexPath(indexPath)
        cell.configure(with: model)
        return cell
    }
}

//--------------------------------------------------
// MARK: - UITableViewDelegate
//--------------------------------------------------
extension BestRepositoryView: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView:UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        presenter.showNextPageIfNeeded(offsetY: offsetY,
                                       contentHeight: contentHeight,
                                       scrollViewHeight: scrollView.frame.height
        )
    }
}
