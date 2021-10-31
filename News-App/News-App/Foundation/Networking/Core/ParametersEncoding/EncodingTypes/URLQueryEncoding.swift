//
//  URLQueryEncoding.swift
//  News-App
//
//  Created by Sherif Khaled on 31/10/2021.
//

import Foundation

struct URLQueryEncoding: ParametersEncoding {
    func urlRequest(_ request: URLRequest, withEncoded parameters: [String : Any]) -> URLRequest {
        var mutableRequest = request
        
        guard let requestURL = request.url,
              var requestURLComponents = URLComponents(string: requestURL.absoluteURL.absoluteString) else { return mutableRequest }
        
        var queryItems: [URLQueryItem] = []
        parameters.forEach { key, value in
            let queryItem = URLQueryItem(name: key,
                                         value: "\(value)")
            queryItems.append(queryItem)
        }
        requestURLComponents.queryItems = queryItems
        mutableRequest.url = requestURLComponents.url
        return mutableRequest
    }
}
