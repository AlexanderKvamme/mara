//
//  ViewController.swift
//  mara
//
//  Created by Alexander Kvamme on 08/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import UIKit
import SnapKit


class MainViewController: UIViewController {

    // MARK: - Properties
    
    private var recentExperiencesView: RecentExperiencesView
    
    // MARK: - Initializers
    
    init() {
        self.recentExperiencesView = RecentExperiencesView(number: 100)
        
        super.init(nibName: nil, bundle: nil)
        
        setup()
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setup() {
        view.backgroundColor = UIColor.mara.backgroundColor
    }
    
    private func addSubviews() {
        view.addSubview(recentExperiencesView)
        recentExperiencesView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(300)
        }
    }
}

