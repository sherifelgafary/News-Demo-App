//
//  JSONEncoding.swift
//  News-App
//
//  Created by Sherif Khaled on 31/10/2021.
//

import Foundation

struct JSONEncoding: ParametersEncoding {
    
    // MARK: - Properties
    let options: JSONSerialization.WritingOptions
    
    // MARK: - Init
    init(options: JSONSerialization.WritingOptions = []) {
        self.options = options
    }
    
    // MARK: - Functions
    func urlRequest(_ request: URLRequest, withEncoded parameters: [String : Any]) -> URLRequest {
        let paramtersData = try? JSONSerialization.data(withJSONObject: parameters,
                                                       options: options)
        var mutableRequest = request
        mutableRequest.httpBody = paramtersData
        return mutableRequest
    }
}
