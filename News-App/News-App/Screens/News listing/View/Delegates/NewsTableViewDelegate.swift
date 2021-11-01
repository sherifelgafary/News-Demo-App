//
//  NewsTableViewDelegate.swift
//  News-App
//
//  Created by Sherif Khaled on 01/11/2021.
//

import Foundation
import UIKit

class NewsTableViewDelegate: NSObject, UITableViewDelegate {
    var news: [Article] = []
    let fetchNewDataDelegate: NewsListingViewFetchNewDataProtocol
    
    init(fetchNewDataDelegate: NewsListingViewFetchNewDataProtocol) {
        self.fetchNewDataDelegate = fetchNewDataDelegate
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.fetchNewDataDelegate.newsItemIsSelected(newsItem: self.news[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.news.count - 4 {
            fetchNewDataDelegate.getNewData()
        }
    }
}

extension NewsTableViewDelegate: NewsDataOwnerProtocole {
    func set(news: [Article]) {
        self.news.append(contentsOf: news)
    }
    
    func clearItems() {
        self.news = []
    }
}
