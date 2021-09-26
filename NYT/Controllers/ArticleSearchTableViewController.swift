//
//  ArticleSearchTableViewController.swift
//  NYT
//
//  Created by Iman Zabihi on 26/09/2021.
//

import UIKit

class ArticleSearchTableViewController: UITableViewController {

    var articles = [Articles]()
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Articles"
        APIManager.fetchArticlesSearch(urlString: url!) { article in
            switch article {
            case .success(let list):
                self.articles = list.response.docs
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("ERROR fetching article search: \(error)")
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = articles[indexPath.row].lead_paragraph
        cell.detailTextLabel?.text = articles[indexPath.row].pub_date
        return cell
    }

}
