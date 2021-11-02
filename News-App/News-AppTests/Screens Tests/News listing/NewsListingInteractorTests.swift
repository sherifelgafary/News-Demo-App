//
//  NewsListingInteractorTests.swift
//  News-AppTests
//
//  Created by Sherif Khaled on 02/11/2021.
//

import XCTest
@testable import News_App

class NewsListingInteractorTests: XCTestCase {

    var presenter: NewsListingPresenterSpy!
    var newsListingWorker: NewsListingWorkerMock!
    var sut: NewsListingInteractor!
    
    override func setUpWithError() throws {
        presenter = NewsListingPresenterSpy()
        newsListingWorker = NewsListingWorkerMock()
        sut = NewsListingInteractor(presenter: presenter, newsListingWorker: newsListingWorker)
    }
    
    func test_getNewsList_willPassRightParamterToWorker() throws {
        // given
        let searchKeyWord = "latest"
        // when
        sut.getNewsList(with: searchKeyWord)
        
        //then
        XCTAssertEqual(newsListingWorker.newsListingRequest.searchKeyWord,searchKeyWord)
    }
    
    func test_getNewsList_atSuccessState_willCallPresenterShowVehicles() throws {
        // given
        let searchKeyWord = "latest"

        // when
        newsListingWorker.simulateType = .success
        sut.getNewsList(with: searchKeyWord)

        //then
        XCTAssertTrue(presenter.showNewsCalled)
    }
    
    func test_getNewsList_atFailureState_willCallPresenterShowError() throws {
        // given
        let searchKeyWord = "latest"

        // when
        newsListingWorker.simulateType = .failure
        sut.getNewsList(with: searchKeyWord)

        //then
        XCTAssertTrue(presenter.showErrorCalled)
    }

    func test_getNewsList_willCallPresenterShowLoaderWhenRequestIntiates() throws {
        // given
        let searchKeyWord = "latest"

        // when
        newsListingWorker.simulateType = .failure
        sut.getNewsList(with: searchKeyWord)

        //then
        XCTAssertTrue(presenter.showLoaderCalled)
    }

    func test_getNewsList_willCallPresenterHideLoaderWhenRequestFinishes() throws {
        // given
        let searchKeyWord = "latest"

        // when
        newsListingWorker.simulateType = .failure
        sut.getNewsList(with: searchKeyWord)

        //then
        XCTAssertTrue(presenter.hideLoaderCalled)
    }
    
    func test_getNewsList_atSuccessState_willPassSameAmmountOfVehiclesToPresenter() throws {
        // given
        let searchKeyWord = "latest"

        // when
        newsListingWorker.simulateType = .success
        sut.getNewsList(with: searchKeyWord)

        //then
        XCTAssertEqual(newsListingWorker.mockedNews.count, presenter.news.count)
    }
    
    override func tearDownWithError() throws {
        presenter = nil
        newsListingWorker = nil
        sut = nil
    }

}
