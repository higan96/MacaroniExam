//
//  NormalArticleCell.swift
//  MacaroniExam
//
//  Created by Norihiko Oba on 2019/02/14.
//  Copyright © 2019 Norihiko Oba. All rights reserved.
//

import UIKit

class NormalArticleCell: UITableViewCell {
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    func configure(with article: NormalArticle ) {
        titleLabel.text = article.title
    }
}
