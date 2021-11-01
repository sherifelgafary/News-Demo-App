//
//  NewsDetailsConnfigrator.swift
//  News-App
//
//  Created by Sherif Khaled on 02/11/2021.
//

import Foundation
import UIKit

struct NewsDetailsConnfigrator: ConfiguratorProtocol {
    typealias INPUT = Article
    static func configureVC(with input: Article) -> UIViewController {
        let view = NewsDetailsViewController.storyboardViewController()
        view.newsItem = input
        return view
    }
}
