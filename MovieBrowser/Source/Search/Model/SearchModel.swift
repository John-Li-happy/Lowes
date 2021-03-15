//
//  SearchModel.swift
//  MovieBrowser
//
//  Created by Zhaoyang Li on 3/13/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

struct SingleResult: Decodable {
    var posterPath: String?
    var title: String?
    var voteAverage: Double?
    var overView: String?
    var releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case title = "title"
        case voteAverage = "vote_average"
        case overView = "overview"
        case releaseDate = "release_date"
    }
}

struct ResultsContainer: Decodable {
    var results: [SingleResult]
}

protocol MovieProtocol {
    var title: String? { get }
    var voteString: String? { get }
    var dateString: String? { get }
    var overView: String? { get }
    var imagePath: String? { get }
}
