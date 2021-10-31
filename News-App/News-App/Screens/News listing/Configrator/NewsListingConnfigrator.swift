//
//  NewsListingConnfigrator.swift
//  News-App
//
//  Created by Sherif Khaled on 31/10/2021.
//

import Foundation
import UIKit

struct NewsListingConnfigrator: ConfiguratorProtocol {
    static func configureVC() -> UIViewController {
        let view = NewsListingViewController.storyboardViewController()
        let presenter = NewsListingPresenter(view: view)
        let interactor = NewsListingInteractor(presenter: presenter,
                                            vehicleWorker: NewsListingWorker())
        view.interactor = interactor
        return view
    }
}
