//
//  NewsListingPresenter.swift
//  News-App
//
//  Created by Sherif Khaled on 31/10/2021.
//

import Foundation

protocol NewsListingPresenterProtocol {
}

final class NewsListingPresenter: NewsListingPresenterProtocol {
    
    // MARK: - Properties
    unowned var view: NewsListingViewProtocol!
    
    // MARK: - Init
    init(view: NewsListingViewProtocol) {
        self.view = view
    }
    
    // MARK: - Functions
}
