//
//  SearchTableViewCell.swift
//  MovieBrowser
//
//  Created by Zhaoyang Li on 3/13/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

protocol ReusableCellProtocol {
    static var reuseIdentifier: String { get }
}

extension ReusableCellProtocol {
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}

class SearchTableViewCell: UITableViewCell, ReusableCellProtocol {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var voteLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(model: MovieProtocol) {
        titleLabel.text = model.title
        dateLabel.text = model.dateString
        voteLabel.text = model.voteString
    }
}
