//
//  ArticleEntity.swift
//  MacaroniExam
//
//  Created by Norihiko Oba on 2019/02/14.
//  Copyright © 2019 Norihiko Oba. All rights reserved.
//

import Foundation

// 混乱の低減のため、直接NormalArticleやMovieArticleにデコードするより、すべてのタイプ（typeカラム）に対応するArticleEntityをまず作る。
// その後、NormalArticleやMovieArticleのinitの引数にArticleEntityを渡す形でオブジェクトを作る設計にした

struct ArticleEntity: Decodable {
    let id: String
    let title: String
    let iconURLString: String
    let movieCookName: String
    let squareIconURLString: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case movieCookName = "movie_cook_name"
        case squareIconURLString = "square_icon"
        case iconURLString = "icon"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        movieCookName = try container.decodeIfPresent(String.self, forKey: .movieCookName) ?? ""
        squareIconURLString = try container.decodeIfPresent(String.self, forKey: .squareIconURLString) ?? ""
        iconURLString = try container.decodeIfPresent(String.self, forKey: .iconURLString) ?? ""
    }
}
