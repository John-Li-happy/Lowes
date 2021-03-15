//
//  DetailTests.swift
//  MovieBrowserTests
//
//  Created by Zhaoyang Li on 3/13/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import XCTest
@testable import MovieBrowser

class DetailTests: XCTestCase {

    func testDetail() {
        let viewModel = DetailViewModel()
        
        viewModel.fetchImage(imagePath: "") { (image, error) in
            XCTAssertNil(image)
            XCTAssertNotNil(error)
        }
    }

}
