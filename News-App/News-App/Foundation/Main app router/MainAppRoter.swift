//
//  MainAppRoter.swift
//  News-App
//
//  Created by Sherif Khaled on 31/10/2021.
//

import UIKit

enum AppStartFlowStates {
    case MainFlow
}

protocol MainAppRoter {
    var navigationController: UINavigationController? { get }
    
    func manageAppStartRoute(with state: AppStartFlowStates) -> UIViewController
    init(navigationController: UINavigationController)
}

class MainAppRoterImplementation: MainAppRoter {
    weak var navigationController: UINavigationController?

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func manageAppStartRoute(with state: AppStartFlowStates) -> UIViewController {
        switch state {
        case .MainFlow:
            self.navigationController?.viewControllers = [getNewsListingView()]
            return self.navigationController!
        }
    }
    
    func getNewsListingView() -> UIViewController {
        let newsListingVC = NewsListingConnfigrator.configureVC()
        return newsListingVC
    }
}
