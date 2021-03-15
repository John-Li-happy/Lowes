//
//  SampleAppTests.swift
//  SampleAppTests
//
//  Created by Struzinski, Mark - Mark on 9/17/20.
//  Copyright © 2020 Lowe's Home Improvement. All rights reserved.
//

import XCTest
@testable import MovieBrowser

class SampleAppTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    func testData() {
        let json: [String: Any] = [
            "results": [
                [
                "title": "Pink Z-Z-Z",
                "overview": "A constantly meowing alley cat keeps the Pink Panther awake.",
                "vote_average": 6.2,
                "release_date": "1978-12-23",
                "poster_path": "http://"
                ]
            ]
        ]
        
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)
            let rawData = try JSONDecoder().decode(ResultsContainer.self, from: data)
            XCTAssertNotNil(rawData)
            
            XCTAssertEqual(rawData.results[0].title, "Pink Z-Z-Z")
            XCTAssertEqual(rawData.results[0].overView, "A constantly meowing alley cat keeps the Pink Panther awake.")
            XCTAssertEqual(rawData.results[0].voteAverage, 6.2)
            XCTAssertEqual(rawData.results[0].posterPath, "http://")
            XCTAssertEqual(rawData.results[0].releaseDate, "1978-12-23")
        } catch { XCTFail() }
    }
    
    override class func tearDown() {
        super.tearDown()
    }
}
