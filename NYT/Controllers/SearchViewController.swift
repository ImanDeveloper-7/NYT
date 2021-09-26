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
        if textField.text == "" {
            let alert = UIAlertController(title: "Oops!", message: "Search something in the text field.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        if let vc = storyboard?.instantiateViewController(identifier: "ArticleSearchTableViewController") as? ArticleSearchTableViewController {
            vc.url = K.articleSearchUrl + "articlesearch.json?q=\(textField.text!)&api-key=" + K.apiKey
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
