//
//  NewsResponse.swift
//  News-App
//
//  Created by Sherif Khaled on 01/11/2021.
//

import Foundation

// MARK: - NewsListingResponse
struct NewsListingResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author, title, articleDescription: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String

    var creationDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: self.publishedAt)!
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
    
    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
