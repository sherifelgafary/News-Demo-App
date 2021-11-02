//
//  NewsListingPresenterSpy.swift
//  News-AppTests
//
//  Created by Sherif Khaled on 02/11/2021.
//

import Foundation
@testable import News_App


class NewsListingPresenterSpy: NewsListingPresenterProtocol {
    
    // MARK: - Properties
    var showNewsCalled = false
    var showErrorCalled = false
    var showLoaderCalled = false
    var hideLoaderCalled = false

    var news: [Article] = []
    
    func show(News news: [Article]) {
        showNewsCalled = true
        self.news = news
    }
    
    func show(Error error: Error) {
        showErrorCalled = true
    }
    
    func showLoading() {
        showLoaderCalled = true
    }
    
    func hideLoading() {
        hideLoaderCalled = true
    }
}
