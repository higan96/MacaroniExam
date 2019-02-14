//
//  ViewController.swift
//  MacaroniExam
//
//  Created by Norihiko Oba on 2019/02/14.
//  Copyright © 2019 Norihiko Oba. All rights reserved.
//

import UIKit
import RxSwift

class ArticlesViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataStore = ArticlesDataStore()
        let repository = ArticlesRepository(dataStore: dataStore)
        let viewModel = ArticlesViewModel(repository: repository)
        
        tableView.register(cellType: MovieArticleCell.self)
        tableView.register(cellType: NormalArticleCell.self)

        viewModel.articles
            .bind(to: tableView.rx.items) { tableView, row, article in
                let indexPath = IndexPath(row: row, section: 0)
                switch article.type {
                case .normal:
                    let cell = tableView.dequeueReusableCell(with: NormalArticleCell.self, for: indexPath)
                    cell.configure(with: article as! NormalArticle)
                    return cell
                case .movie:
                    let cell = tableView.dequeueReusableCell(with: MovieArticleCell.self, for: indexPath)
                    cell.configure(with: article as! MovieArticle)
                    return cell
                }
            }
            .disposed(by: bag)
        
        viewModel.error
            .subscribe(onNext: { error in
                print(error.localizedDescription)
            })
            .disposed(by: bag)
    }
}

