//
//  NewsTableViewCell.swift
//  News-App
//
//  Created by Sherif Khaled on 01/11/2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    static let Identifier = String(describing: NewsTableViewCell.self)
    @IBOutlet weak var newsThumbnailImageView: DesignableImageView!
    @IBOutlet weak var newsTitleLabel: DesignableLabel!
    @IBOutlet weak var newsDescriptionLabel: DesignableLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.newsThumbnailImageView.roundCorners(corners: [.topLeft,.topRight], radius: 8)
    }
    
    func configure(with newsItem: Article) {
        self.newsTitleLabel.text = newsItem.title
        self.newsDescriptionLabel.text = newsItem.articleDescription
        self.newsThumbnailImageView.setImage(stringUrl: newsItem.urlToImage, placeholderImage: UIImage(named: "placeholder image")!)
        self.layoutIfNeeded()
    }
}
