//
//  UIViewController.swift
//  News-App
//
//  Created by Sherif Khaled on 30/10/2021.
//

import UIKit

protocol Storyboardable: AnyObject {
    static var storyboardObject: UIStoryboard { get }
}

extension Storyboardable where Self: UIViewController {
    static func storyboardViewController() -> Self {
        let viewControllerId = NSStringFromClass(self).components(separatedBy: ".").last ?? ""
        guard let vc = storyboardObject.instantiateViewController(withIdentifier: viewControllerId) as? Self else {
            fatalError("Could not instantiate initial storyboard with name: \(storyboardObject.description)")
        }

        return vc
    }
}

