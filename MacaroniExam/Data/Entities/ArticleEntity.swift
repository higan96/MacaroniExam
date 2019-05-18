//
//  ArticleEntity.swift
//  MacaroniExam
//
//  Created by Norihiko Oba on 2019/02/14.
//  Copyright © 2019 Norihiko Oba. All rights reserved.
//

import Foundation

// 直接NormalArticleやMovieArticleにデコードするより、まず汎用なArticleEntityを作る。
// その後、NormalArticleやMovieArticleのinitの引数にArticleEntityを渡す形でtypeカラムの内容に則したオブジェクトを作る設計にした。
// これはArticleの変更の影響を最小に抑えるための施策。つまり、articleとtypeの変更が多そうなので、ここに変更の影響を閉じ込めよう、という企て。
// いくつかのパターンを考えた上で、この形が変更の多い（と私が予想する）領域において、最良の設計に思えた。普通は個人の予測じゃなくて、チームの話し合いで決まるけども。

struct ArticleEntity: Decodable {
    let id: String
    let title: String
    let iconURLString: String
    let movieTitle: String
    let squareIconURLString: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case movieTitle = "movie_title"
        case squareIconURLString = "square_icon_url"
        case iconURLString = "icon_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // 共通
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        
        // 非共通
        movieTitle = try container.decodeIfPresent(String.self, forKey: .movieTitle) ?? ""
        squareIconURLString = try container.decodeIfPresent(String.self, forKey: .squareIconURLString) ?? ""
        iconURLString = try container.decodeIfPresent(String.self, forKey: .iconURLString) ?? ""
    }
}
