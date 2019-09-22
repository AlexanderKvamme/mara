//
//  MyTableViewController.swift
//  mara
//
//  Created by Alexander Kvamme on 21/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation
import UIKit


final class MyTableViewController: UITableView {
    
    // MARK: Properties
    
    // MARK: Initializers
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .grouped)
        
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        allowsSelection = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods
    
    // MARK: Helper methods
    
    // MARK: Internal methods
    
}
