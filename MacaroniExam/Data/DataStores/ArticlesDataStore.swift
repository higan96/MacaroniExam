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
    private let apiClient: APIClent
    
    public init() {
        apiClient = APIClent(URLSession: URLSession.shared)
    }
    
    func articles() -> Observable<ArticlesResponse> {
        return apiClient.request(url: articlesUrl)
            .map { data -> ArticlesResponse in
                do {
                    let response = try JSONDecoder().decode(ArticlesResponse.self, from: data)
                    if response.result {
                        return response
                    } else {
                        throw APIError.unknown
                    }
                }
                catch {
                    throw error
                }
            }
        }
}
