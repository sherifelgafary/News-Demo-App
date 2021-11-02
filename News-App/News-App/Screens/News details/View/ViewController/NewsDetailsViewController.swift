//
//  NewsDetailsViewController.swift
//  News-App
//
//  Created by Sherif Khaled on 01/11/2021.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var newsThumbnailImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    // MARK: - Properties
    var newsItem:Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewData()
    }
    
    func setViewData() {
        self.newsThumbnailImageView.setImage(stringUrl: newsItem.urlToImage, placeholderImage: UIImage(named: "placeholder image")!)
        self.newsTitleLabel.text = newsItem.title
        self.newsDescriptionLabel.text = newsItem.articleDescription
        sourceLabel.text = "Source: \(self.newsItem.source!.name!)"
        authorLabel.text = "Author: \(self.newsItem.author)"
        createdAtLabel.text = "Created at: \(self.newsItem.creationDate)"
        contentLabel.text = self.newsItem.content
    }
    
    @IBAction func readMoreClicked(_ sender: Any) {
        UIApplication.shared.open(URL(string: newsItem.url)!, options: [:]) { success in
        }
    }
}

extension NewsDetailsViewController: Storyboardable {
    static var storyboardObject: UIStoryboard {
        return UIStoryboard(name: StoryBoards.NewsDetails.rawValue, bundle: Bundle(for: self))
    }
}
