//
//  ServiceTests.swift
//  MovieBrowserTests
//
//  Created by Zhaoyang Li on 3/13/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import XCTest
@testable import MovieBrowser

class ServiceTests: XCTestCase {
    
    var movieCellViewModel: MovieCellViewModel?
    
    override func setUp() {
        super.setUp()
    }
    
    func testNetwork() {
        let asyncExpect = expectation(description: "service tests")
        
        let service = Network.shared
        let parameter = [
                        AppConstants.SearchViews.apiKeyQuery: AppConstants.SearchViews.apiKey,
                        AppConstants.SearchViews.apiQuery: "star"
                                                                ]
        service.fetchData(url: AppConstants.SearchViews.rootUrlPath, parameters: parameter, type: ResultsContainer.self) { response, error in
            asyncExpect.fulfill()
            XCTAssertNil(error)
            XCTAssertNotNil(response?.results)
            XCTAssertNotNil(response?.results.first?.title)
            
            // for properties
            if let movieData = response?.results.first {
                self.movieCellViewModel = MovieCellViewModel(movieData: movieData)
                
                XCTAssertNotNil(self.movieCellViewModel?.imagePath)
                XCTAssertNotNil(self.movieCellViewModel?.title)
                XCTAssertNotNil(self.movieCellViewModel?.overView)
                XCTAssertNotNil(self.movieCellViewModel?.voteString)
                XCTAssertNotNil(self.movieCellViewModel?.dateString)                
            }
        }
        wait(for: [asyncExpect], timeout: 60)
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
