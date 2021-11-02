//
//  NewsListingInteractorSpy.swift
//  News-AppTests
//
//  Created by Sherif Khaled on 02/11/2021.
//

import Foundation
@testable import News_App

class NewsListingInteractorSpy: NewsListingInteractorProtocol {
    
    
    // MARK: - Properties
    let presenter: NewsListingPresenterProtocol
    let vehicleWorker: NewsListingWorkerProtocol
    
    var getNewsCalled = false
    
    // MARK: - Init
    required init(presenter: NewsListingPresenterProtocol, newsListingWorker: NewsListingWorkerProtocol) {
        self.presenter = presenter
        self.vehicleWorker = newsListingWorker
    }
    
    // MARK: - Functions
    func getNewsList(with searchKeyword: String) {
        getNewsCalled = true
        self.presenter.showLoading()
        self.presenter.hideLoading()
    }
}
