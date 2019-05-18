//
//  Article.swift
//  MacaroniTest
//
//  Created by Norihiko Oba on 2019/02/14.
//  Copyright © 2019 Norihiko Oba. All rights reserved.
//

import Foundation

protocol Article {
    var id: String { get }
    var type: ArticleType { get }
}

enum ArticleType: String {
    case normal, movie
}

struct MovieArticle: Article {
    let id: String
    let type = ArticleType.movie
    let movieTitle: String
    let squareIconURL: URL?
    
    init(entity: ArticleEntity) {
        id = entity.id
        movieTitle = entity.movieTitle
        squareIconURL = URL(string: entity.squareIconURLString)
    }
}

struct NormalArticle: Article {
    let id: String
    let type = ArticleType.normal
    let title: String
    let iconURL: URL?
    
    init(entity: ArticleEntity) {
        id = entity.id
        title = entity.title
        iconURL = URL(string: entity.iconURLString)
    }
}
