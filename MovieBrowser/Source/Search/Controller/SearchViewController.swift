//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/19/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
        }
    }
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.tableFooterView = UIView()
        }
    }
    
    lazy var viewModel = SearchViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func goButtonTapped(_ sender: UIButton) {
        goSearch()
    }
    
    private func noTextAlert() {
        let alert = UIAlertController(title: "Attention", message: "Please retype the movie Name", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func goSearch() {
        if let text = searchBar.text?.trimmingCharacters(in: .whitespaces) {
            if text.isEmpty {
                noTextAlert()
            } else {
                viewModel.getAllResults(query: text)
            }
        }
        searchBar.resignFirstResponder()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.separatorStyle = .singleLine
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseIdentifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        cell.configureCell(model: viewModel.singleCellData(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyBoard = UIStoryboard(name: AppConstants.StoryBoardViews.storyBoardName, bundle: nil)
        if let detailViewController = storyBoard.instantiateViewController(identifier: AppConstants.StoryBoardViews.movieDetailViewController) as? MovieDetailViewController {
            detailViewController.movie = viewModel.singleCellData(index: indexPath.row)
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if viewModel.numberOfRows() == 0 {
            return AppConstants.SearchViews.noDataMessage
        } else {
             return nil
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        goSearch()
    }
}

extension SearchViewController: SearchViewModelProtocol {
    func gotAllResults() {
        tableView.reloadData()
    }
}
