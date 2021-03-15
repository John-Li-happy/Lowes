//
//  SearchTests.swift
//  MovieBrowserTests
//
//  Created by Zhaoyang Li on 3/13/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import XCTest
@testable import MovieBrowser

class SearchTests: XCTestCase, SearchViewModelProtocol {
    
    func gotAllResults() {
        print("back")
    }
    
    func testSearchViewModel() {
        let asyncExpect = expectation(description: "service tests")
        
        let service = Network.shared
        let parameter = [
                        AppConstants.SearchViews.apiKeyQuery: AppConstants.SearchViews.apiKey,
                        AppConstants.SearchViews.apiQuery: "star"
                                                                ]
        service.fetchData(url: AppConstants.SearchViews.rootUrlPath, parameters: parameter, type: ResultsContainer.self) { response, error in
            asyncExpect.fulfill()
            guard let result = response?.results else { return }

            let viewModel = SearchViewModel(delegate: self)
            var allMovies = [MovieCellViewModel]()
            result.forEach { movie in
                let movieModel = MovieCellViewModel(movieData: movie)
                allMovies.append(movieModel)
            }
            viewModel.dataSource = allMovies
            XCTAssertNotNil(viewModel.dataSource)
            XCTAssertNotNil(viewModel.singleCellData(index: 0))
        }
        wait(for: [asyncExpect], timeout: 60)
    }
    
    func testGetAllResults() {
        let viewModel = SearchViewModel(delegate: self)
        viewModel.getAllResults(query: "star")
    }
    
    func testCell() {
        let cell = SearchTableViewCell(frame: CGRect(x: 0, y: 0, width: 320, height: 44))
        XCTAssertNotEqual(cell.reuseIdentifier, "SearchTableViewCell")
    }
    
    func testDate() {
        let json: [String: Any] = [
            "results": [
                [
                "title": "Pink Z-Z-Z",
                "overview": "A constantly meowing alley cat keeps the Pink Panther awake.",
                "vote_average": 6.2,
                "release_date": nil,
                "poster_path": "http://"
                ],
                [
                "title": "Pink Z-Z-Z",
                "overview": "A constantly meowing alley cat keeps the Pink Panther awake.",
                "vote_average": 6.2,
                "release_date": "1111",
                "poster_path": "http://"
                ]
            ]
        ]
        
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)
            let rawData = try JSONDecoder().decode(ResultsContainer.self, from: data)
            XCTAssertNotNil(rawData)
            XCTAssertEqual(rawData.results[0].releaseDate, nil)
            let nilDateViewModel = MovieCellViewModel(movieData: rawData.results[0])
            XCTAssertEqual(nilDateViewModel.dateString, AppConstants.SearchViews.noDateMessage)
            
        } catch { XCTFail() }
    }

}
