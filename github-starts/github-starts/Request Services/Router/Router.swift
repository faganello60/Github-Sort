//
//  Router.swift
//  github-starts
//
//  Created by Bruno Faganello Neto on 05/06/19.
//  Copyright © 2019 Faganello. All rights reserved.
//

import UIKit

class Router<EndPoint:EndPointType>:NetworkRouter {
    private var task:URLSessionTask?
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                NetworkLog.log(with: request, response: response, data: data)
                DispatchQueue.main.async {
                    completion(data, response, error)
                }
            })
            
        }catch {
            DispatchQueue.main.async {
                completion(nil, nil, error)
            }
        }
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    fileprivate func buildRequest(from route:EndPoint) throws -> URLRequest {
        var request:URLRequest = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                            timeoutInterval: 10.0)
        request.httpMethod = route.httpMethod.rawValue
        
        do {
            switch route.task {
            case .request:
                self.addAdditionalHeader(route.headers, request: &request)
                //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParameters(let bodyParameters, let urlParameters):
                self.addAdditionalHeader(route.headers, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            case .requestParametersAndHeader(let bodyParameters, let urlParameters, let additionalHeader):
                self.addAdditionalHeader(additionalHeader, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    fileprivate func configureParameters(bodyParameters:Parameters?, urlParameters:Parameters?, request: inout URLRequest) throws {
        do {
            if let body = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &request, with: body)
            }
            if let url = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &request, with: url)
            }
        }catch {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeader(_ additionalHeader: HTTPHeaders?, request:inout URLRequest) {
        guard let header = additionalHeader else {return}
        for (key, value) in header {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}
