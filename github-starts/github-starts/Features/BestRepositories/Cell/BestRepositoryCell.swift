//
//  BestRepositoryCell.swift
//  github-starts
//
//  Created by Bruno Faganello Neto on 07/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import UIKit

protocol BestRepositoryCellRepresentable {
    var repositoryName: String { get set }
    var repositoryStars: String { get set }
    var ownerName: String { get set }
    var ownerPictureURL: String { get set }
}

class BestRepositoryCell: UITableViewCell {

    //--------------------------------------------------
    // MARK: - Outlets
    //--------------------------------------------------
   
    @IBOutlet private weak var ownerImageView: UIImageView!
    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet private weak var ownerNameLabel: UILabel!
    @IBOutlet private weak var starsCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //--------------------------------------------------
    // MARK: - Cell Configuration
    //--------------------------------------------------
    
    func configure(with viewModel: BestRepositoryCellRepresentable) {
        ownerImageView.downloadImage(urlString: viewModel.ownerPictureURL)
        ownerNameLabel.text = viewModel.ownerName
        repositoryNameLabel.text = viewModel.repositoryName
        starsCountLabel.text = viewModel.repositoryStars
    }
}
