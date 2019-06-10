//
//  RootWireframeSpec.swift
//  github-startsTests
//
//  Created by Bruno Faganello Neto on 09/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import Quick
import Nimble
@testable import github_starts

class RootWireframeSpec: QuickSpec {
    override func spec() {
        describe("AppStartup") {
            context("RootwireFrame") {
                it("FirstView") {
                    let view = RootWireframe.createFirstScene() as? UINavigationController
                    expect(view?.viewControllers[0]).to(beAnInstanceOf(BestRepositoryView.self))
                }
            }
        }
    }
}
