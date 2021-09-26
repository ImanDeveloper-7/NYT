//
//  ViewController.swift
//  NYT
//
//  Created by Iman Zabihi on 25/09/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    var mainView = [MainView]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.append(MainView.init(headerTitle: "Search", subTitles: ["Search Articles"]))
        mainView.append(MainView.init(headerTitle: "Popular", subTitles: ["Most Viewd", "Most Shared", "Most Emailed"]))
    }
}

//MARK: - TableView DataSource Methods

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return mainView.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainView[section].subTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = mainView[indexPath.section].subTitles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mainView[section].headerTitle
    }
}

//MARK: - TableView Delegate Methods

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        if  currentCell.textLabel?.text == "Search Articles" {
            if let vc = storyboard?.instantiateViewController(identifier: "SearchViewController") as? SearchViewController {
                navigationController?.pushViewController(vc, animated: true)
            }
        } else if currentCell.textLabel?.text == "Most Viewd" {
            if let vc = storyboard?.instantiateViewController(identifier: "ArticleslistViewController") as? ArticleslistViewController {
                vc.url = K.mostViewdUrl
                navigationController?.pushViewController(vc, animated: true)
            }
            
        } else if currentCell.textLabel?.text == "Most Shared" {
            if let vc = storyboard?.instantiateViewController(identifier: "ArticleslistViewController") as? ArticleslistViewController {
                vc.url = K.mostSharedUrl
                navigationController?.pushViewController(vc, animated: true)
            }
            
        } else if currentCell.textLabel?.text == "Most Emailed" {
            if let vc = storyboard?.instantiateViewController(identifier: "ArticleslistViewController") as? ArticleslistViewController {
                vc.url = K.mostEmailedUrl
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
