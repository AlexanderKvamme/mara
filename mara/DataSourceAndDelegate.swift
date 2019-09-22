//
//  DataSourceAndDelegate.swift
//  mara
//
//  Created by Alexander Kvamme on 22/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation
import UIKit

final class Screen {
    static let height = UIScreen.main.bounds.height
    static let width = UIScreen.main.bounds.width
}

final class DataSourceAndDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties

    let items = RateGroup.mocks
    
    // MARK: Sections and rows
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section].items[indexPath.row]
        let cell = MyCell(style: .default, reuseIdentifier: MyCell.reuseIdentifier)
        cell.update(with: item)
        cell.animate(item: item)
        
        return cell
    }
    
    // Headers
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = GroupSectionHeader()
        header.update(with: items[section])
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return GroupSectionHeader.size.height
    }
}



