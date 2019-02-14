//
//  ArticlesResponse.swift
//  MacaroniExam
//
//  Created by Norihiko Oba on 2019/02/14.
//  Copyright © 2019 Norihiko Oba. All rights reserved.
//

import Foundation

struct ArticlesResponse: Decodable {
    let result: Bool
    let data: [ArticleResponseItem]
    enum CodingKeys: String, CodingKey {
        case result
        case data
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        result = try container.decode(Bool.self, forKey: .result)
        data = try container.decode([ArticleResponseItem].self, forKey: .data)
    }
}