//
//  NewsListingWorkerMock.swift
//  News-AppTests
//
//  Created by Sherif Khaled on 02/11/2021.
//

import Foundation
@testable import News_App

class NewsListingWorkerMock: NewsListingWorkerProtocol {
    
    enum SimulateType {
        case success
        case failure
    }
    
    // MARK: - Constans
    let mockedNews: [Article] = [
        Article(source: Source(id: nil, name: "source 1"), author: "author 1", title: "title 1", articleDescription: "article Description 1", url: "https://lifehacker.com/download-your-iphones-latest-security-update-asap-1847845362", urlToImage: "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/10e1a87a87d6d21619d7d5f240a1ef09.jpg", publishedAt: "2021-10-12T14:00:00Z", content: "content 1"), Article(source: Source(id: nil, name: "source 2"), author: "author 2", title: "title 2", articleDescription: "article Description 1", url: "https://lifehacker.com/download-your-iphones-latest-security-update-asap-1847845362", urlToImage: "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/10e1a87a87d6d21619d7d5f240a1ef09.jpg", publishedAt: "2021-10-12T14:00:00Z", content: "content 2")
    ]
    
    let mockedError: Error = NSError(domain: "NSURLErrorDomain",
                                     code: -1001,
                                     userInfo: ["NSLocalizedDescription": "The request timed out."])
    
    // MARK: - Properties
    var simulateType: SimulateType = .success
    var newsListingRequest: NewsListingRequest!
    var page: Int = 1
    var shouldContinuePaging: Bool = true

   
    // MARK: - Functions
    func getNewsList(with searchKeyword:String, resultHandler: @escaping (NewsListingResult) -> Void) {
        self.newsListingRequest = NewsListingRequest(searchKeyWord: searchKeyword, page: self.page)
        switch simulateType {
        case .success:
            resultHandler(.success(mockedNews))
        case .failure:
            resultHandler(.failure(mockedError))
        }
    }
}
