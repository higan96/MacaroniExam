//
//  ArticlesViewModel.swift
//  MacaroniExam
//
//  Created by Norihiko Oba on 2019/02/14.
//  Copyright © 2019 Norihiko Oba. All rights reserved.
//

import Foundation
import RxSwift

class ArticlesViewModel {
    let error: Observable<Error>
    let articles: Observable<[Article]>
    private let repository: ArticlesRepository
    
    init(repository: ArticlesRepository) {
        self.repository = repository
        let results = repository.articles().materialize().share(replay: 1)
        articles = results.flatMap { $0.element.map(Observable.just) ?? .empty() }
        error = results.flatMap { $0.error.map(Observable.just) ?? .empty() }
    }
}
