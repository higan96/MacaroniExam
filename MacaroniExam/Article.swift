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
    var thumbnailURL: URL? { get }
}

enum ArticleType: String {
    case normal, movie = "movies"
}

struct MovieArticle: Article, Decodable {
    let id: String
    let movieCookName: String
    var thumbnailURL: URL?
}

struct NormalArticle: Article, Decodable {
    let id: String
    let title: String
    var thumbnailURL: URL?
}
