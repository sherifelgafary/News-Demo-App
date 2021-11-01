//
//  UIImageView.swift
//  News-App
//
//  Created by Sherif Khaled on 01/11/2021.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
        func setImage(stringUrl: String, placeholderImage: UIImage) {
            self.image = placeholderImage
        let url = URL(string: stringUrl)
        image = nil
        if let imageFromCache = imageCache.object(forKey: stringUrl as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        URLSession.shared.dataTask(with: url!) {
            data, response, error in
              if let response = data {
                  DispatchQueue.main.async {
                    if let imageToCache = UIImage(data: response) {
                        imageCache.setObject(imageToCache, forKey: stringUrl as AnyObject)
                        self.image = imageToCache
                    }else{
                                                
                    }
                  }
              }
         }.resume()
      }
}
