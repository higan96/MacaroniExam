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
    private let articlesURL: URL!
    private let apiClient: APIClient
    
    init() {
        #if DEBUG
        let path = Bundle.main.path(forResource: "mock", ofType: "json")!
        articlesURL = URL(fileURLWithPath: path)
        #else
        articlesURL = URL(string: "https://example.com/articles.json")
        #endif
        apiClient = APIClient(URLSession: URLSession.shared)
    }
    
    func articles() -> Observable<ArticlesResponse> {
        return apiClient.request(url: articlesURL)
            .map { data -> ArticlesResponse in
                do {
                    let response = try JSONDecoder().decode(ArticlesResponse.self, from: data)
                    // キーの名前がresultでブール値っぽくないので、trueとの比較式をif文に渡している
                    if response.result == true {
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
