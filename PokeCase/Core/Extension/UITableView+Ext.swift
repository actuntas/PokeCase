//
//  UITableView+Ext.swift
//  PokeCase
//
//  Created by CAN TUNTAS on 6.12.2022.
//

import UIKit

extension UITableView {
    func dequeue<T: ViewIdentifier>(at indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.viewIdentifier, for: indexPath) as? T else {
            fatalError("can not deque cell with identifier \(T.viewIdentifier) from tableView \(self)")
        }
        return cell
    }
    
    func register<T: ViewIdentifier>(type: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.viewIdentifier)
    }
}
