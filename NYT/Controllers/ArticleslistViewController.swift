//
//  ArticleslistViewController.swift
//  NYT
//
//  Created by Iman Zabihi on 25/09/2021.
//

import UIKit

class ArticleslistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var news = [News]()
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        title = "Articles"
        APIManager.fetchNews(urlString: url!) { articles in
            switch articles {
            case .success(let list):
                self.news = list.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("ERROR fetching list of articles: \(error)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let news = news[indexPath.row]
        cell.textLabel?.text = news.title
        cell.detailTextLabel?.text = news.published_date
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
