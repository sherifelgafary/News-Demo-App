//
//  NewsListingInteractor.swift
//  News-App
//
//  Created by Sherif Khaled on 31/10/2021.
//

import Foundation

protocol NewsListingInteractorProtocol {
    init(presenter: NewsListingPresenterProtocol,
         vehicleWorker: NewsListingWorkerProtocol)
}

final class NewsListingInteractor: NewsListingInteractorProtocol {
    
    // MARK: - Properties
    let presenter: NewsListingPresenterProtocol
    let vehicleWorker: NewsListingWorkerProtocol
    
    // MARK: - Init
    init(presenter: NewsListingPresenterProtocol,
         vehicleWorker: NewsListingWorkerProtocol) {
        self.presenter = presenter
        self.vehicleWorker = vehicleWorker
    }
    
    // MARK: - Functions

}
