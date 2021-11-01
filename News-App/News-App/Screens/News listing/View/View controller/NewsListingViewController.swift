//
//  NewsListingViewController.swift
//  News-App
//
//  Created by Sherif Khaled on 30/10/2021.
//

import UIKit

protocol NewsListingViewProtocol: AnyObject {

}

class NewsListingViewController: UIViewController, NewsListingViewProtocol {
    // MARK: - Outlets
    @IBOutlet weak var newsTableView: UITableView!
    
    // MARK: - Properties
    var interactor: NewsListingInteractorProtocol!

    private lazy var searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.searchBar.delegate = self
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.placeholder = "Search for news by name"
        return sc
    }()
    var newsTableViewDataSourcee = NewsTableViewDataSourcee()
    var newsTableViewDelegate = NewsTableViewDelegate()

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        self.configureSearchBar()
    }
    
    // MARK: - Functions
    func configureSearchBar() {
        navigationItem.searchController = searchController
    }
    
    func configureTableView() {
        newsTableView.dataSource = newsTableViewDataSourcee
        newsTableView.delegate = newsTableViewDelegate
        newsTableView.tableFooterView = UIView(frame: .zero)
        newsTableView.rowHeight = UITableView.automaticDimension
        newsTableView.estimatedRowHeight = 250
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: NewsTableViewCell.Identifier)
        
    }
}

// MARK: - UISearchResult Updating and UISearchControllerDelegate  Extension
  extension NewsListingViewController: UISearchBarDelegate {
      func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
          print(searchBar.text)
      }
  }

extension NewsListingViewController: Storyboardable {
    static var storyboardObject: UIStoryboard {
        return .NewsListing
    }
}
