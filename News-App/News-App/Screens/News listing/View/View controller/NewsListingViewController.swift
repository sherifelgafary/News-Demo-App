//
//  NewsListingViewController.swift
//  News-App
//
//  Created by Sherif Khaled on 30/10/2021.
//

import UIKit

protocol NewsListingViewProtocol: AnyObject {
    func updateNewsList(with News: [Article])
}

protocol NewsListingViewFetchNewDataProtocol: AnyObject {
    func getNewData()
    func newsItemIsSelected(newsItem: Article)
}

class NewsListingViewController: UIViewController, NewsListingViewProtocol {
    // MARK: - Outlets
    @IBOutlet weak var newsTableView: UITableView!
    
    // MARK: - Properties
    private lazy var searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.searchBar.delegate = self
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.placeholder = "Search for news"
        return sc
    }()
    var interactor: NewsListingInteractorProtocol!
    var newsTableViewDataSourcee = NewsTableViewDataSourcee()
    var newsTableViewDelegate: NewsTableViewDelegate!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        self.configureSearchBar()
        self.interactor.getNewsList(with: self.searchController.searchBar.text ?? "")
    }
    
    // MARK: - Functions
    func configureSearchBar() {
        navigationItem.searchController = searchController
    }
    
    func configureTableView() {
        newsTableViewDelegate = NewsTableViewDelegate(fetchNewDataDelegate: self)
        newsTableView.dataSource = newsTableViewDataSourcee
        newsTableView.delegate = newsTableViewDelegate
        newsTableView.tableFooterView = UIView(frame: .zero)
        newsTableView.rowHeight = UITableView.automaticDimension
        newsTableView.estimatedRowHeight = 250
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: NewsTableViewCell.Identifier)
    }
    
    func updateNewsList(with News: [Article]) {
        self.newsTableViewDelegate.set(news: News)
        self.newsTableViewDataSourcee.set(news: News)
        self.newsTableView.reloadData()
    }
    
    func clearCurrentItems() {
        self.newsTableViewDelegate.clearItems()
        self.newsTableViewDataSourcee.clearItems()
        self.newsTableView.reloadData()
    }
}

// MARK: - UISearchBarDelegate  Extension
extension NewsListingViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        clearCurrentItems()
        self.interactor.getNewsList(with: searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        clearCurrentItems()
        self.interactor.getNewsList(with: searchBar.text ?? "")
    }
}

extension NewsListingViewController: NewsListingViewFetchNewDataProtocol {
    func getNewData() {
        self.interactor.getNewsList(with: self.searchController.searchBar.text ?? "")
    }
    
    func newsItemIsSelected(newsItem: Article) {
        
    }
}

extension NewsListingViewController: Storyboardable {
    static var storyboardObject: UIStoryboard {
        return .NewsListing
    }
}
