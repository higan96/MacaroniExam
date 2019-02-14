//
//  APIClent.swift
//  MacaroniExam
//
//  Created by Norihiko Oba on 2019/02/14.
//  Copyright © 2019 Norihiko Oba. All rights reserved.
//

import Foundation
import RxCocoa

class APIClent {
    private let articlesUrl = URL(string: "http://104.198.124.217/employment/articles.json")!
    private let URLSession: URLSession
    
    init(URLSession: URLSession) {
        self.URLSession = URLSession
    }
    
    func articles() {
        let request = URLRequest(url: articlesUrl)
//        URLSession.rx.response(request: request)
//            .map { pair in
//                do {
//                    let reposense = try JSONDecoder(
//                }
//            }
    }
}
