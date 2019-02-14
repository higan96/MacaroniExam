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
    private let margin: CGFloat = 15.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headerFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: margin / 2))
        let dataStore = ArticlesDataStoreImpl()
        let repository = ArticlesRepositoryImpl(dataStore: dataStore)
        let viewModel = ArticlesViewModel(repository: repository)
        
        tableView.register(cellType: MovieArticleCell.self)
        tableView.register(cellType: NormalArticleCell.self)
        tableView.tableHeaderView = headerFooterView
        tableView.tableFooterView = headerFooterView

        viewModel.articles
            .bind(to: tableView.rx.items) { tableView, row, article in
                let indexPath = IndexPath(row: row, section: 0)
                switch article.type {
                case .normal:
                    let cell = tableView.dequeueReusableCell(with: NormalArticleCell.self, for: indexPath)
                    // 確実に失敗しないのでフォースキャスト
                    cell.configure(with: article as! NormalArticle)
                    return cell
                case .movie:
                    let cell = tableView.dequeueReusableCell(with: MovieArticleCell.self, for: indexPath)
                    // 確実に失敗しないのでフォースキャスト
                    cell.configure(with: article as! MovieArticle)
                    return cell
                }
            }
            .disposed(by: bag)
        
        viewModel.error
            .subscribe(onNext: { error in
                // エラー処理をここに書く
                print(error.localizedDescription)
            })
            .disposed(by: bag)
    }
}

