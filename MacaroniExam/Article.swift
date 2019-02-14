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
}

struct MovieArticle: Article, Decodable {
    let id: String
    let movieCookName: String
    let squareIconUrl: URL
}

struct NormalArticle: Article, Decodable {
    let id: String
    let title: String
    let iconUrl: URL
}
