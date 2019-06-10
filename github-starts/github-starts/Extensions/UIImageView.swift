//
//  UIImageView.swift
//  github-starts
//
//  Created by Bruno Faganello Neto on 07/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func downloadImage(urlString:String) {
        guard let url = URL(string: urlString) else {
            self.image = UIImage(named: "placeholder")
            return
        }
        self.kf.setImage(with: url)
    }
}
