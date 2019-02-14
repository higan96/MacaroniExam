//
//  ArticleResponseItem.swift
//  MacaroniExam
//
//  Created by Norihiko Oba on 2019/02/14.
//  Copyright © 2019 Norihiko Oba. All rights reserved.
//

import Foundation

struct ArticleResponseItem: Decodable {
    let type: String
    let articleEntity: ArticleEntity
    
    enum CodingKeys: String, CodingKey {
        case type
        case articleEntity = "article"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(String.self, forKey: .type)
        articleEntity = try container.decode(ArticleEntity.self, forKey: .articleEntity)
    }
}
