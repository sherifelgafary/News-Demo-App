//
//  Loadable.swift
//  News-App
//
//  Created by Sherif Khaled on 01/11/2021.
//

import Foundation
import UIKit

protocol Loadable {
    func showLoader()
    func hideLoader()
}

extension Loadable where Self: UIViewController {
    func showLoader() {
        var config = SwiftLoader.Config()
        config.size = 150
        config.titleTextColor = .white
        config.spinnerColor = .white
        config.backgroundColor = UIColor(named:"AccentColor")!
        config.foregroundColor = .black
        config.foregroundAlpha = 0.5
        SwiftLoader.setConfig(config: config)
        SwiftLoader.show(title: "Loading...", animated: true)
    }
    
    func hideLoader() {
        SwiftLoader.hide()
    }
}

