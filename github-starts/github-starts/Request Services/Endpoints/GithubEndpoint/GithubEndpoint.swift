//
//  GithubEndpoint.swift
//  github-starts
//
//  Created by Bruno Faganello Neto on 06/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import UIKit

//--------------------------------------------------
// MARK: - Endpoint cases
//--------------------------------------------------

enum GithubEndpoint {
    case search(language: String, sort: String, page: Int)
}

//--------------------------------------------------
// MARK: - Endpoint Informations
//--------------------------------------------------

extension GithubEndpoint: EndPointType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.github.com") else { fatalError("Invalid URL") }
        return url
    }
    
    var path: String {
        switch self {
        case .search(_, _, _):
            return "search/repositories"
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .search(let language, let sort, let page):
            return .requestParameters(bodyParameters: nil,
                                      urlParameters: ["q":language, "sort":sort, "page":page]
            )
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
}

//--------------------------------------------------
// MARK: - Github Endpoint Manager
//--------------------------------------------------

struct GithubManager: EndPointManager {
    
    enum Language: String {
        case swift = "language:swift"
    }
    
    enum Sort: String {
        case stars = "stars"
    }

    typealias T = GithubEndpoint
    
    func searchRepositories(with language: Language,
                            sorted: Sort,
                            page: Int,
                            successHandler: @escaping ( _ model:SearchInformation) ->(),
                            errorHandler: @escaping ( _ error:Error) ->()) {
        
        router.request(.search(language: language.rawValue,
                               sort: sorted.rawValue,
                               page: page)) { (data, response, error) in
                              
                            let result:DecodeResult<SearchInformation> =
                                DecoderResponse().decodeResponser(data: data, response: response, error: error)

                            switch result{
                            case .success(let model):
                                successHandler(model)
                            case .failure(let error):
                                errorHandler(error)
                            }
        }
    }
}
