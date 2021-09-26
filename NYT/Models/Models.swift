//
//  Models.swift
//  NYT
//
//  Created by Iman Zabihi on 25/09/2021.
//

import Foundation

struct NYTNews: Codable {
    let results: [News]
}

struct News: Codable {
    let title: String?
    let published_date: String?
}

struct Root: Codable {
    let response: Article
}

struct Article: Codable {
    let docs: [Articles]
}

struct Articles: Codable {
    let lead_paragraph: String?
    let pub_date: String?
}
