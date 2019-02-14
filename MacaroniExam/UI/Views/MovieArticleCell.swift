//
//  MovieArticleCell.swift
//  MacaroniExam
//
//  Created by Norihiko Oba on 2019/02/14.
//  Copyright © 2019 Norihiko Oba. All rights reserved.
//

import UIKit
import SDWebImage

class MovieArticleCell: UITableViewCell {
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    func configure(with article: MovieArticle ) {
        titleLabel.text = article.movieCookName
        iconImageView.sd_setImage(with: article.squareIconURL)
    }
}
