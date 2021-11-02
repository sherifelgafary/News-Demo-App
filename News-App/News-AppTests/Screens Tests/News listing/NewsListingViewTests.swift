//
//  NewsListingViewTests.swift
//  News-AppTests
//
//  Created by Sherif Khaled on 02/11/2021.
//

import Foundation
import XCTest
@testable import News_App

class NewsListingViewTests: XCTestCase {
    
    var interactor: NewsListingInteractorSpy!
    var presenter: NewsListingPresenter!
    var newsListingWorker: NewsListingWorkerMock!
    var sut: NewsListingViewController!
    
    override func setUpWithError() throws {
        sut = NewsListingViewController()
        presenter = NewsListingPresenter(view: sut)
        newsListingWorker = NewsListingWorkerMock()
        interactor = NewsListingInteractorSpy(presenter: presenter,
                                              newsListingWorker: newsListingWorker)
        sut.interactor = interactor
    }
        
    func test_viewDidLoad_willGetNewsDataWillGetCalled() {
        // when
        sut.getNewData()
        
        //then
        XCTAssertTrue(interactor.getNewsCalled)
    }
            
    
    override func tearDownWithError() throws {
        interactor = nil
        presenter = nil
        newsListingWorker = nil
        sut = nil
    }
}
