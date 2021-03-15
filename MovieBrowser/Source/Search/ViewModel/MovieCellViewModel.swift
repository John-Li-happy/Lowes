//
//  MovieCellViewModel.swift
//  MovieBrowser
//
//  Created by Zhaoyang Li on 3/13/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieCellViewModel: MovieProtocol {
    private var movieData: SingleResult
    
    init(movieData: SingleResult) {
        self.movieData = movieData
    }
    
    var title: String? {
        self.movieData.title
    }
    
    var voteString: String? {
        if let vote = movieData.voteAverage {
            return String(vote)
        }
        return AppConstants.SearchViews.noVoteMessage 
    }
    
    var dateString: String? {
        if let date = movieData.releaseDate {
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = AppConstants.SearchViews.rawDateFormat

            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = AppConstants.SearchViews.searchDateFormat

            guard let date = dateFormatterGet.date(from: date) else  { return nil }
            return dateFormatterPrint.string(from: date)
        } else {
            return AppConstants.SearchViews.noDateMessage
        }
    }
    
    var overView: String? {
        self.movieData.overView
    }
    
    var imagePath: String? {
        self.movieData.posterPath
    }    
}
