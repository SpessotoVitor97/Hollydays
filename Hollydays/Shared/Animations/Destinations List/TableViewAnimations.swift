//
//  TableViewAnimations.swift
//  Hollydays
//
//  Created by Vitor Spessoto on 21/02/22.
//

import UIKit

typealias TableCellAnimation = (UITableViewCell, IndexPath, UITableView) -> Void

class TableViewAnimator {
    private let animation: TableCellAnimation
    
    init(animation: @escaping TableCellAnimation) {
        self.animation = animation
    }
    
    func animate(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) {
        animation(cell, indexPath, tableView)
    }
}
