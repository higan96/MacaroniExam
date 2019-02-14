//
//  UITableView.swift
//  MacaroniExam
//
//  Created by Norihiko Oba on 2019/02/14.
//  Copyright © 2019 Norihiko Oba. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(cellType: T.Type) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        if let cell = self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as? T {
            return cell
        } else {
            assert(false, "CellのTypeとIdentifierが一致しない")
        }
    }
}
