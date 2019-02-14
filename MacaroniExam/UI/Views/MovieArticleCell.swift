//
//  MovieArticleCell.swift
//  MacaroniExam
//
//  Created by Norihiko Oba on 2019/02/14.
//  Copyright © 2019 Norihiko Oba. All rights reserved.
//

import UIKit

class MovieArticleCell: UITableViewCell {
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    func configure(with article: MovieArticle ) {
        titleLabel.text = article.movieCookName
    }
}
