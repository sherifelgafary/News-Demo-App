//
//  Configrator.swift
//  News-App
//
//  Created by Sherif Khaled on 31/10/2021.
//

import Foundation
import UIKit

protocol ConfiguratorProtocol {
    associatedtype INPUT
    static func configureVC(with input: INPUT) -> UIViewController
}
