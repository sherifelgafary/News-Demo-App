//
//  BaseRequest.swift
//  News-App
//
//  Created by Sherif Khaled on 01/11/2021.
//

import Foundation

class BaseRequest: EndPointRequest {
    private(set) var provider: EndPointProvider = NewsAppAPI()
    var path: String { ""}
    var method: HTTPMethod { .get }
    var headers: [String : String] { [:] }
    var parameters: [String : Any] {
        [:]
    }
    var parametersEncoding: ParametersEncoding { URLQueryEncoding() }
    var cachPolicy: NSURLRequest.CachePolicy { .reloadIgnoringCacheData }
    var timeoutInterval: TimeInterval { 25 }
}
