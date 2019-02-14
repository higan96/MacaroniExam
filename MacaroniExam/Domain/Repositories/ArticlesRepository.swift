//
//  ArticlesRepository.swift
//  MacaroniExam
//
//  Created by Norihiko Oba on 2019/02/14.
//  Copyright © 2019 Norihiko Oba. All rights reserved.
//

import Foundation
import RxSwift

protocol ArticlesRepository {
    func articles() -> Observable<[Article]>
}

class ArticlesRepositoryImpl: ArticlesRepository {
    let dataStore: ArticlesDataStore
    
    init(dataStore: ArticlesDataStore) {
        self.dataStore = dataStore
    }
    
    func articles() -> Observable<[Article]> {
        return dataStore.articles()
            .map { response -> [Article] in
                // 新しい記事のタイプがtypeカラムに追加された場合（たとえばmusicなど）、落ちたりエラー表示をせずにcompactMapで無視するようにしている
                // その方がアプリが落ちたり空白セルが表示されたりの不具合にユーザーを晒さないため
                return response.data.compactMap {
                    guard let type = ArticleType(rawValue: $0.type) else { return nil }
                    switch type {
                    case .movie:
                        return MovieArticle(entity: $0.articleEntity)
                    case .normal:
                        return NormalArticle(entity: $0.articleEntity)
                    }
                }
            }
    }
}
