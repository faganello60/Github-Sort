//
//  RootWireframe.swift
//  +Sangue-Swift
//
//  Created by Bruno Faganello Neto on 25/05/19.
//  Copyright © 2019 Mariana Medeiro. All rights reserved.
//

import UIKit

protocol AppStartup {
    static func createFirstScene() -> UIViewController
}

struct RootWireframe: AppStartup {
    
    private init() {}
    
    static func createFirstScene() -> UIViewController {
        return startView()
    }

    private static func startView() -> UIViewController {
        let bestRepositoryWireframe = BestRepositoryWireframe()
        let navigationController = UINavigationController(rootViewController: bestRepositoryWireframe.view)
        return navigationController
    }
}
