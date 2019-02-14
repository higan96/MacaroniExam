//
//  ArticlesDataStoreTests.swift
//  MacaroniExamTests
//
//  Created by Norihiko Oba on 2019/02/14.
//  Copyright © 2019 Norihiko Oba. All rights reserved.
//

import XCTest
import RxBlocking

@testable import MacaroniExam

class ArticlesDataStoreTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
        
    }
    
    func testFetchingArticles() {
        let dataStore = ArticlesDataStore(URLSession: URLSession.shared)
        do {
            let response = try dataStore.articles().toBlocking().first()!
            XCTAssertTrue(response.result)
            XCTAssertGreaterThanOrEqual(response.data.count, 1)
        } catch {
            XCTFail()
        }
    }
}
