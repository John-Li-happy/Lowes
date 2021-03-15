//
//  ErrorTests.swift
//  MovieBrowserTests
//
//  Created by Zhaoyang Li on 3/13/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import XCTest
@testable import MovieBrowser

class ErrorTests: XCTestCase {

    func testError() {
        let error: AppError = .invalidUrl
        XCTAssertFalse(error.localizedDescription.isEmpty)
        
    }
    
    func testgenericError() {
        let error = AppError.genericError
        XCTAssertNotNil(error)
    }
    
    func testcustomError() {
        let error: AppError = .custom("this is a custom error")
        XCTAssertFalse(error.localizedDescription.isEmpty)
    }
}
