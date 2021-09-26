//
//  APIManager.swift
//  NYT
//
//  Created by Iman Zabihi on 25/09/2021.
//

import Foundation

class APIManager {
    
    static func fetchNews(urlString: String, completion: @escaping (Result<NYTNews, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("Error url session: \(error?.localizedDescription ?? "N/A")")
                }
                
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let jsonData = try decoder.decode(NYTNews.self, from: safeData)
                        completion(.success(jsonData))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
            task.resume()
        }
    }
    
    static func fetchArticlesSearch(urlString: String, completion: @escaping (Result<ArticleSearch, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("Error url session: \(error?.localizedDescription ?? "N/A")")
                }
                
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let jsonData = try decoder.decode(ArticleSearch.self, from: safeData)
                        completion(.success(jsonData))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
            task.resume()
        }
    }
}
