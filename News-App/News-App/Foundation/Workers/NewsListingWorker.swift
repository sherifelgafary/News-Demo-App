//
//  NewsListingWorker.swift
//  News-App
//
//  Created by Sherif Khaled on 31/10/2021.
//

import Foundation

protocol NewsListingWorkerProtocol {
    var page: Int { get set }
    var shouldContinuePaging: Bool { get set }
    
    typealias NewsListingResult =  Result<[Article], Error>
    typealias NewsListingAPIResult =  Result<NewsListingResponse, Error>
    
    func getNewsList(with searchKeyword:String, resultHandler: @escaping (NewsListingResult) -> Void)
}

final class NewsListingWorker: NewsListingWorkerProtocol {
    
    // MARK: - Properties
    private var newsListingRequest: NewsListingRequest!
    var page: Int = 1
    var shouldContinuePaging: Bool = true
    
    // MARK: - Functions
    func getNewsList(with searchKeyword:String, resultHandler: @escaping (NewsListingResult) -> Void) {
        self.newsListingRequest = NewsListingRequest(searchKeyWord: searchKeyword, page: self.page)
        let api = self.newsListingRequest.provider
        api.execute(self.newsListingRequest) { (result: NewsListingAPIResult) in
            self.page += 1
            switch result {
            case .success(let response):
                resultHandler(.success(response.articles))
                if response.articles.isEmpty {
                    self.shouldContinuePaging = false
                }
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
}

