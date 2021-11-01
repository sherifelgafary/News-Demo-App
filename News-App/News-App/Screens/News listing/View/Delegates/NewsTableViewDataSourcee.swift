//
//  NewsTableViewDataSourcee.swift
//  News-App
//
//  Created by Sherif Khaled on 01/11/2021.
//

import Foundation
import UIKit

protocol NewsDataOwnerProtocole: AnyObject {
    var news: [Article] {get set}
    func set(news:[Article])
    func clearItems()
}

class NewsTableViewDataSourcee: NSObject, UITableViewDataSource {
    var news: [Article] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.Identifier, for: indexPath) as! NewsTableViewCell
        cell.configure(with: self.news[indexPath.row])
        return cell
    }
}

extension NewsTableViewDataSourcee: NewsDataOwnerProtocole {
    func set(news: [Article]) {
        self.news.append(contentsOf: news)
    }
    
    func clearItems() {
        self.news = []
    }
}
