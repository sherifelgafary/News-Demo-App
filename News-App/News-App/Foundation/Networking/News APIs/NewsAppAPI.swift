//
//  NewsAppAPI.swift
//  News-App
//
//  Created by Sherif Khaled on 01/11/2021.
//

import Foundation
import Combine

final class NewsAppAPI: EndPointProvider {
    var cancellableRequests: Set<AnyCancellable> = []
    var baseURL: URL { URL(string: "https://newsapi.org/v2")! }
}
