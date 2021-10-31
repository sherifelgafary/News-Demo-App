//
//  EndPointProvider.swift
//  News-App
//
//  Created by Sherif Khaled on 31/10/2021.
//

import Foundation
import Combine

protocol EndPointProvider: AnyObject {
    var baseURL: URL { get }
    var cancellableRequests: Set<AnyCancellable> { get set }
    func execute<MODEL>(_ request: EndPointRequest,
                        completionHandler: @escaping (Result<MODEL, Error>) -> Void) where MODEL: Codable
}

extension EndPointProvider {
    func execute<MODEL>(_ request: EndPointRequest,
                        completionHandler: @escaping (Result<MODEL, Error>) -> Void) where MODEL: Codable {
        URLSession.shared.dataTaskPublisher(for: request.urlRequest)
            .map { $0.data }
            .decode(type: MODEL.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case let .failure(error) = completion {
                    completionHandler(.failure(error))
                }
            } receiveValue: { response in
                completionHandler(.success(response))
            }.store(in: &cancellableRequests)
    }
}
