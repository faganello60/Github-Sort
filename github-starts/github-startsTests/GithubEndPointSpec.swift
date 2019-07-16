//
//  GithubEndPointSpec.swift
//  github-startsTests
//
//  Created by Bruno Faganello Neto on 09/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import Quick
import Nimble
@testable import github_starts


class GithubEndPointSpec: QuickSpec {
    override func spec() {
        describe("Github EndPoint") {
            context("Creating a case") {
                let endpoint = GithubEndpoint.search(language: "swift", sort: "stars", page: 0)

                it("Testing Base URL") {
                    expect(endpoint.baseURL).to(equal(URL(string:"https://api.github.com")))
                }

                it("Testing Path") {
                    expect(endpoint.path).to(equal("search/repositories"))
                }
                
                it("Testing HTTP Method") {
                    expect(endpoint.httpMethod).to(equal(HTTPMethod.get))
                }
            }
        }
    }
}
