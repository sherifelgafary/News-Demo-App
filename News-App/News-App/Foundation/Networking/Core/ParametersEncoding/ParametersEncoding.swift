//
//  ParametersEncoding.swift
//  News-App
//
//  Created by Sherif Khaled on 31/10/2021.
//

import Foundation

protocol ParametersEncoding {
    func urlRequest(_ request: URLRequest, withEncoded parameters: [String: Any]) -> URLRequest
}
