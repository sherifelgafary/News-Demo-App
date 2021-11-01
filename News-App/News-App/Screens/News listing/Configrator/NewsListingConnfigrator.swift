//
//  NewsListingConnfigrator.swift
//  News-App
//
//  Created by Sherif Khaled on 31/10/2021.
//

import Foundation
import UIKit

struct NewsListingConnfigrator: ConfiguratorProtocol {
    typealias INPUT = UINavigationController
    static func configureVC(with input: UINavigationController) -> UIViewController {
        let view = NewsListingViewController.storyboardViewController()
        let presenter = NewsListingPresenter(view: view)
        let interactor = NewsListingInteractor(presenter: presenter,
                                               newsListingWorker: NewsListingWorker())
        let router = NewsListingRouter(navigationController: input)
        view.interactor = interactor
        view.router = router
        return view
    }
}
