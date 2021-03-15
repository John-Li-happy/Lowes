//
//  DataModelTests.swift
//  MovieBrowserTests
//
//  Created by Zhaoyang Li on 3/13/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import XCTest
@testable import MovieBrowser

class DataModelTests: XCTestCase {
    func testDataModel() {
        let movie = SingleResult(posterPath: "http://",
                                 title: "dummy Movie",
                                 voteAverage: 9.9,
                                 overView: "This is a nice move",
                                 releaseDate: "2020-01-10")
        XCTAssertEqual(movie.overView, "This is a nice move")
        XCTAssertEqual(movie.posterPath, "http://")
        XCTAssertEqual(movie.voteAverage, 9.9)
        XCTAssertEqual(movie.releaseDate, "2020-01-10")
        XCTAssertEqual(movie.title, "dummy Movie")
    }
}
