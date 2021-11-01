//
//  NewsListingWorker.swift
//  News-App
//
//  Created by Sherif Khaled on 31/10/2021.
//

import Foundation

protocol NewsListingWorkerProtocol {
    var page: Int { get set }
    var searchKeyword: String? { get set }
    var shouldContinuePaging: Bool { get set }

    typealias NewsListingResult =  Result<[Article], Error>
    typealias NewsListingAPIResult =  Result<NewsListingResponse, Error>
    
    func getNewsList(using searchKeyword:String?, resultHandler: @escaping (NewsListingResult) -> Void)
}

final class NewsListingWorker: NewsListingWorkerProtocol {

    // MARK: - Properties
    private var newsListingRequest: NewsListingRequest!
    var page: Int = 1
    var searchKeyword: String? = nil
    var shouldContinuePaging: Bool = true
    
    // MARK: - Functions
    func getNewsList(using searchKeyword:String?, resultHandler: @escaping (NewsListingResult) -> Void) {
        if searchKeyword != nil {
            self.searchKeyword = searchKeyword
            self.page = 1
            self.shouldContinuePaging = true
        }
        self.newsListingRequest = NewsListingRequest(searchKeyWord: self.searchKeyword, page: self.page)
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

