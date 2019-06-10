//
//  UITbaleViewCell.swift
//  github-starts
//
//  Created by Bruno Faganello Neto on 07/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import UIKit

protocol ReusableView: class {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    
    static var reuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension UITableViewCell: ReusableView { }
extension UITableViewCell: NibLoadableView { }
