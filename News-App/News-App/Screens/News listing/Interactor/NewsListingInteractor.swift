//
//  NewsListingInteractor.swift
//  News-App
//
//  Created by Sherif Khaled on 31/10/2021.
//

import Foundation

protocol NewsListingInteractorProtocol {
    init(presenter: NewsListingPresenterProtocol,
         newsListingWorker: NewsListingWorkerProtocol)
    func getNewsList(with searchKeyword: String)
}

final class NewsListingInteractor: NewsListingInteractorProtocol {
    
    // MARK: - Properties
    let presenter: NewsListingPresenterProtocol
    let newsListingWorker: NewsListingWorkerProtocol
    
    // MARK: - Init
    init(presenter: NewsListingPresenterProtocol,
         newsListingWorker: NewsListingWorkerProtocol) {
        self.presenter = presenter
        self.newsListingWorker = newsListingWorker
    }
    
    // MARK: - Functions
    func getNewsList(with searchKeyword: String) {
        if newsListingWorker.shouldContinuePaging {
            newsListingWorker.getNewsList(with: searchKeyword) { [weak self] result in
                switch result {
                case .success(let news):
                    self?.presenter.show(News: news)
                case .failure(let error):
                    self?.presenter.show(Error: error)
                }
            }
        }
    }
    
}
