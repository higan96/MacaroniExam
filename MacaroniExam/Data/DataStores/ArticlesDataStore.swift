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

protocol ArticlesDataStore {
    func articles() -> Observable<ArticlesResponse>
}

class ArticlesDataStoreImpl: ArticlesDataStore {
    // 確実に失敗しないのでフォースキャスト
    // 補足：エンドポイントが複数あるときはenumでの定義を検討すると思う
    private let articlesUrl = URL(string: "https://example.com/articles.json")!
    private let apiClient: APIClent
    
    init() {
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
                        // response.resultがfalseの場合のサーバーサイドの仕様が不明なため、unknownを定義しthrowしている
                        throw APIError.unknown
                    }
                }
                catch {
                    throw error
                }
            }
        }
}
