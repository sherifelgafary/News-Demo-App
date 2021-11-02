//
//  NewsListingConfiguratorTests.swift
//  News-AppTests
//
//  Created by Sherif Khaled on 02/11/2021.
//

import Foundation
import XCTest
@testable import News_App

class NewsListingConfiguratorTests: XCTestCase {
    
    func test_configureVC_linkingAllLayersWithEachOther() throws {
        // given
        let navigationController = UINavigationController()

        // when
        let newsListingVC = NewsListingConnfigrator.configureVC(with: navigationController)

        
        // then
        let viewController = try XCTUnwrap(newsListingVC as? NewsListingViewController)
        XCTAssertNotNil(viewController.interactor)
        
        let interactor = try XCTUnwrap(viewController.interactor as? NewsListingInteractor)
        XCTAssertNotNil(interactor.presenter)
        XCTAssertNotNil(interactor.newsListingWorker)
        
        let presenter = try XCTUnwrap(interactor.presenter as? NewsListingPresenter)
        XCTAssertNotNil(presenter.view)
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
