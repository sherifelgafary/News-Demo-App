//
//  Notifiable.swift
//  News-App
//
//  Created by Sherif Khaled on 01/11/2021.
//

import Foundation
import UIKit

enum ToastNotification {
    case success(String)
    case info(String)
    case warning(String)
    case error(String)
}

protocol Notifiable {
    func show(notification: ToastNotification)
}

extension Notifiable where Self: UIViewController {
    func show(notification: ToastNotification) {
        view.hideAllToasts()
        var style = ToastStyle()
        style.backgroundColor = notification.backgroundColor
        view.makeToast(notification.message,
                       duration: 2,
                       position: .top,
                       style: style)
        }
}

extension ToastNotification {
    var backgroundColor: UIColor {
        switch self {
        case .success: return UIColor(named: "SuccessColor")!
        case .info: return .black
        case .warning: return .yellow
        case .error: return .red
        }
    }
    
    var message: String {
        switch self {
        case .success(let msg),
                .info(let msg),
                .warning(let msg),
                .error(let msg):
            return msg
        }
    }
}
