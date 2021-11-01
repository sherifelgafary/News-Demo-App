//
//  NewsListingRequest.swift
//  News-App
//
//  Created by Sherif Khaled on 01/11/2021.
//

import Foundation

class NewsListingRequest: BaseRequest {
    var searchKeyWord: String
    var page: Int
    var pageSize: Int = 20
    var sortBy: String = "popularity"
    var apiKey: String = "c3de4c588af043478790ab2faecd937d"
    override var path: String { "/everything" }
    override var parameters: [String : Any] {[
        "q": searchKeyWord.isEmpty ? "latest" : searchKeyWord,
        "page": page,
        "pageSize": pageSize,
        "sortBy": sortBy,
        "apiKey": apiKey
    ]}
    
    // MARK: - Init
    init(searchKeyWord:String, page:Int) {
        self.searchKeyWord = searchKeyWord
        self.page = page
    }
}
