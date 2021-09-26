//
//  SearchViewController.swift
//  NYT
//
//  Created by Iman Zabihi on 25/09/2021.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(identifier: "ArticleSearchTableViewController") as? ArticleSearchTableViewController {
            vc.url = K.articleSearchUrl + "articlesearch.json?q=\(textField.text!)&api-key=" + K.apiKey
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
