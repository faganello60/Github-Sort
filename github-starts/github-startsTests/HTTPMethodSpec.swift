//
//  HTTPMethodSpec.swift
//  github-startsTests
//
//  Created by Bruno Faganello Neto on 09/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import Quick
import Nimble
@testable import github_starts

class HTTPMethodSpec: QuickSpec {
    override func spec() {
        describe("HTTP Method") {
            context("Creating HTTP Method") {
                var method = HTTPMethod.get
                it("GET Method") {
                    expect(method.rawValue).to(equal("GET"))
                }
                
                it("POST Method") {
                    method = HTTPMethod.post
                    expect(method.rawValue).to(equal("POST"))
                }
                
                it("PUT Method") {
                    method = HTTPMethod.put
                    expect(method.rawValue).to(equal("PUT"))
                }
                
                it("DELETE Method") {
                    method = HTTPMethod.delete
                    expect(method.rawValue).to(equal("DELETE"))
                }
                
                it("PATCH Method") {
                    method = HTTPMethod.patch
                    expect(method.rawValue).to(equal("PATCH"))
                }
            }
        }
    }
}
