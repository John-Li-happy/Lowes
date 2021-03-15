//
//  AppConstants.swift
//  MovieBrowser
//
//  Created by Zhaoyang Li on 3/13/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

struct AppConstants {
    
    enum SearchViews {
        static let apiKey = "5885c445eab51c7004916b9c0313e2d3"
        
        static let apiKeyQuery = "api_key"
        
        static let apiQuery = "query"
        
        static let rootUrlPath = "https://api.themoviedb.org/3/search/movie"
        
        static let noDataMessage = "No searched Data"
        
        static let rawDateFormat = "yyyy-MM-dd"
        
        static let searchDateFormat = "MMMM dd, yyyy"
        
        static let noDateMessage = "No release date"
        
        static let noVoteMessage = "No vote"
    }
    
    enum DetailView {
        static let imageRootPath = "https://image.tmdb.org/t/p/original/"
        
        static let detailDateFormat = "MM/dd/yy"
        
        static let noDiscriptionMessage = "There are no fetched discription"
    }
    
    enum StoryBoardViews {
        static let storyBoardName = "Main"
        
        static let movieDetailViewController = "MovieDetailViewController"
    }
    
}
