//
//  NewsListingRouter.swift
//  News-App
//
//  Created by Sherif Khaled on 02/11/2021.
//

import Foundation
import UIKit

protocol NewsListingRouterProtocol {
    func newsItemClicked(newsItem:Article)
}

class NewsListingRouter: NewsListingRouterProtocol {
    
    // MARK: - Properties
    var navigationController: UINavigationController

    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Functions
    
    func newsItemClicked(newsItem:Article) {
        let VC = NewsDetailsConnfigrator.configureVC(with: newsItem)
        self.navigationController.pushViewController(VC, animated: true)
    }
}

