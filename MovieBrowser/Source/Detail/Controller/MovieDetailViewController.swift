//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var contentTextView: UITextView!
    
    var movie: MovieProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disPlayResult()
    }
    
    private func disPlayResult() {
        titleLabel.text = movie?.title
        if let date = movie?.dateString {
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = AppConstants.SearchViews.searchDateFormat

            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = AppConstants.DetailView.detailDateFormat

            if let date = dateFormatterGet.date(from: date) {
                dateLabel.text = "Release Date: \(dateFormatterPrint.string(from: date))"
            }
        }
        
        guard let overView = movie?.overView else { return }
        contentTextView.text = overView.isEmpty ? AppConstants.DetailView.noDiscriptionMessage : movie?.overView
        
        if let imagePath = movie?.imagePath {
            DetailViewModel().fetchImage(imagePath: imagePath) { image, error in
                if error == nil {
                    DispatchQueue.main.async { self.movieImageView.image = image }
                }
            }
        }
    }
}
