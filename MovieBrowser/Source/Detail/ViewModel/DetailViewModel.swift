//
//  DetailViewModel.swift
//  MovieBrowser
//
//  Created by Zhaoyang Li on 3/13/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class DetailViewModel {
    func fetchImage(imagePath: String, aSimpleHandler handler: @escaping (UIImage?, Error?) -> Void) {
        let basePath = AppConstants.DetailView.imageRootPath + imagePath
        guard let url = URL(string: basePath) else { return }
        do {
            let data = try Data(contentsOf: url)
            handler(UIImage(data: data), nil)
        } catch { handler(nil, AppError.invalidUrl) }
    }
}
