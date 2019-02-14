//
//  ArticlesRepositoryTests.swift
//  MacaroniExamTests
//
//  Created by Norihiko Oba on 2019/02/14.
//  Copyright © 2019 Norihiko Oba. All rights reserved.
//

import XCTest
import RxBlocking

@testable import MacaroniExam

class ArticlesRepositoryTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testCovertArticles() {
        let dataStore = ArticlesDataStore(URLSession: URLSession.shared)
        let repository = ArticlesRepository(dataStore: dataStore)
        
        do {
            let articles = try repository.articles().toBlocking().first()!
            XCTAssertGreaterThanOrEqual(articles.count, 1)
        } catch {
            XCTFail()
        }
    }
}
