//
//  ArticlesDataStore.swift
//  MacaroniExam
//
//  Created by Norihiko Oba on 2019/02/14.
//  Copyright © 2019 Norihiko Oba. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public class ArticlesDataStore {
    private let articlesUrl = URL(string: "https://example.com/articles.json")!
    private let URLSession: URLSession
    
    public init(URLSession: URLSession) {
        self.URLSession = URLSession
    }
    
    func articles() -> Observable<ArticlesResponse> {
        let request = URLRequest(url: articlesUrl)
        return URLSession.rx.response(request: request)
            .map { pair in
                do {
                    let response = try JSONDecoder().decode(ArticlesResponse.self, from: pair.data)
                    return response
                }
                catch {
                    throw error
                }
            }
        }
}
