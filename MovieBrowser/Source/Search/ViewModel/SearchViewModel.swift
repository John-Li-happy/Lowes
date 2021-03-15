//
//  SearchViewModel.swift
//  MovieBrowser
//
//  Created by Zhaoyang Li on 3/13/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

protocol SearchViewModelProtocol {
    func gotAllResults()
}

class SearchViewModel {
    
    var delegate: SearchViewModelProtocol
    
    var dataSource: [MovieProtocol] = [] {
        didSet {
            self.delegate.gotAllResults()
        }
    }
    
    init(delegate: SearchViewModelProtocol) {
        self.delegate = delegate
    }
    
    func numberOfRows() -> Int {
        return dataSource.count
    }
    
    func singleCellData(index: Int) -> MovieProtocol {
        return dataSource[index]
    }
    
    func getAllResults(query: String) {
        let parameter = [
                        AppConstants.SearchViews.apiKeyQuery: AppConstants.SearchViews.apiKey,
                        AppConstants.SearchViews.apiQuery: query
                                                                ]
        Network.shared.fetchData(url: AppConstants.SearchViews.rootUrlPath, parameters: parameter, type: ResultsContainer.self) { response, error in
            guard let result = response?.results else { return }
            
            var allMovies = [MovieCellViewModel]()
            result.forEach { movie in
                let movieModel = MovieCellViewModel(movieData: movie)
                allMovies.append(movieModel)
            }
            self.dataSource = allMovies
        }
    }
}
