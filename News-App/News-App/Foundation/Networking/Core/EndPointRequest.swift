//
//  EndPointRequest.swift
//  News-App
//
//  Created by Sherif Khaled on 31/10/2021.
//

import Foundation

protocol EndPointRequest {
    var provider: EndPointProvider { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var parameters: [String: Any] { get }
    var parametersEncoding: ParametersEncoding { get }
    var cachPolicy: NSURLRequest.CachePolicy { get }
    var timeoutInterval: TimeInterval { get }
}

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

extension EndPointRequest {
    var urlRequest: URLRequest {
        guard let url = URL(string: provider.baseURL.absoluteString + path) else {
            preconditionFailure("Bad URL")
        }
        
        var request = URLRequest(url: url,
                                 cachePolicy: cachPolicy,
                                 timeoutInterval: timeoutInterval)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        return parametersEncoding.urlRequest(request,
                                             withEncoded: parameters)
    }
}
