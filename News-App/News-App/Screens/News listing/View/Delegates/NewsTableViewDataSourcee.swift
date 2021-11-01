//
//  NewsTableViewDataSourcee.swift
//  News-App
//
//  Created by Sherif Khaled on 01/11/2021.
//

import Foundation
import UIKit

class NewsTableViewDataSourcee: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.Identifier, for: indexPath) as! NewsTableViewCell
        cell.configure()
        return cell
    }
}
