//
//  OverviewController.swift
//  mara
//
//  Created by Alexander Kvamme on 21/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation
import UIKit

final class TableViewHeader: UIView {
    
    // MARK: Properties
    
    static var size = CGSize(width: Screen.width, height: 200)
    
    private let searchButton = UIButton()
    private let welcomeUserView = WelcomeUserView()
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(origin: .zero, size: TableViewHeader.size))
        
        setup()
        addSubviewsAndConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods
    
    private func setup() {
        searchButton.setImage(UIImage.iconSearch, for: .normal)
    }
    
    private func addSubviewsAndConstraints() {
        addSubview(searchButton)
        addSubview(welcomeUserView)
        
        searchButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(48)
            make.bottom.equalTo(welcomeUserView.snp.bottom)
            make.height.width.equalTo(24)
        }

        welcomeUserView.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top).offset(80)
            make.right.equalToSuperview().offset(-24)
        }
    }
    
    // MARK: Helper methods
    
    // MARK: Internal methods
    
}

final class OverviewController: UIViewController {

    // MARK: - Properties

    private let tableView = MyTableViewController()
    private let dataSourceAndDelegate = DataSourceAndDelegate()
    
    // MARK: Initializers
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        setup()
        addSubviewsAndConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    private func setup() {
        view.backgroundColor = UIColor.mara.backgroundColor
        
        tableView.tableHeaderView = TableViewHeader()
    }
    
    private func addSubviewsAndConstraints() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        tableView.backgroundColor = .white
        tableView.dataSource = dataSourceAndDelegate
        tableView.delegate = dataSourceAndDelegate
        tableView.contentInsetAdjustmentBehavior = .never
    }
}

