//
//  NYTTests.swift
//  NYTTests
//
//  Created by Iman Zabihi on 25/09/2021.
//

import XCTest
@testable import NYT

class NYTTests: XCTestCase {

    func testCanParseNews() throws {
        let json = """
            {
            "status": "OK",
            "copyright": "Copyright (c) 2021 The New York Times Company. All Rights Reserved.",
            "num_results": 20,
            "results": [
            {
            "uri": "nyt://article/f83114c7-f8d4-5d82-9fd3-85f30ea49afd",
            "url": "https://www.nytimes.com/2021/09/17/style/jen-psaki-biden-press-secretary.html",
            "id": 100000007966452,
            "asset_id": 100000007966452,
            "source": "New York Times",
            "published_date": "2021-09-17",
            "updated": "2021-09-21 17:58:35",
            "section": "Style",
            "subsection": "",
            "nytdsection": "style",
            "adx_keywords": "United States Politics and Government;News and News Media;Content Type: Personal Profile;Psaki, Jennifer R;Biden, Joseph R Jr;Obama, Barack",
            "column": null,
            "byline": "By Michael M. Grynbaum",
            "type": "Article",
            "title": "Bully Pulpit No More: Jen Psaki’s Turn at the Lectern"
            }
            ]
            }
            """
        let jsonData = json.data(using: .utf8)!
        let newsData = try! JSONDecoder().decode(NYTNews.self, from: jsonData)
        
        XCTAssertEqual("Bully Pulpit No More: Jen Psaki’s Turn at the Lectern", newsData.results[0].title)
        XCTAssertEqual("2021-09-17", newsData.results[0].published_date)
    }
    
    func testCanParseSearchArticle() throws {
        let json = """
            {
            "status": "OK",
            "copyright": "Copyright (c) 2021 The New York Times Company. All Rights Reserved.",
            "response": {
            "docs": [
            {
            "abstract": "The Conservative Party moved leftward on the issue, effectively depriving the Liberals of a point to attack them on.",
            "web_url": "https://www.nytimes.com/2021/09/20/world/canada/climate-change-election.html",
            "snippet": "The Conservative Party moved leftward on the issue, effectively depriving the Liberals of a point to attack them on.",
            "lead_paragraph": "Canada may be known for its cold weather, but this summer, parts of the country were an inferno.",
            "source": "The New York Times"
            }
            ]
            }
            }
            """
        let jsonData = json.data(using: .utf8)!
        let newsData = try! JSONDecoder().decode(ArticleSearch.self, from: jsonData)
        
        XCTAssertEqual("Canada may be known for its cold weather, but this summer, parts of the country were an inferno.", newsData.response.docs[0].lead_paragraph)
    }

}
