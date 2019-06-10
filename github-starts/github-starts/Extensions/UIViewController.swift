//
//  UIViewController.swift
//  github-starts
//
//  Created by Bruno Faganello Neto on 07/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import UIKit

extension UIViewController {

    func showError(title:String, message:String, buttonAction: @escaping ((UIAlertAction) -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: buttonAction)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
}
