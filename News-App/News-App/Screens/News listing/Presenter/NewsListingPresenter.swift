//
//  NewsListingPresenter.swift
//  News-App
//
//  Created by Sherif Khaled on 31/10/2021.
//

import Foundation

protocol NewsListingPresenterProtocol {
    func show(News news: [Article])
    func show(Error error: Error)
    func showLoading()
    func hideLoading()
}

final class NewsListingPresenter: NewsListingPresenterProtocol {
    
    // MARK: - Properties
    unowned var view: NewsListingViewProtocol!
    
    // MARK: - Init
    init(view: NewsListingViewProtocol) {
        self.view = view
    }
    
    // MARK: - Functions
    func show(News news: [Article]) {
        self.view.updateNewsList(with: news)
    }
    
    func show(Error error: Error) {
        view.show(notification: .error(error.localizedDescription))
    }
    
    func showLoading() {
        view.showLoader()
    }
    
    func hideLoading() {
        view.hideLoader()
    }
}
