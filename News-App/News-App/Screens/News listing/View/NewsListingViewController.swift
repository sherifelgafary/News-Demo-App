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

    // MARK: - Properties
    var interactor: NewsListingInteractorProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewsListingViewController: Storyboardable {
    static var storyboardObject: UIStoryboard {
        return .main
    }
}
