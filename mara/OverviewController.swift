//
//  OverviewController.swift
//  mara
//
//  Created by Alexander Kvamme on 21/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation
import UIKit


final class OverviewController: UIViewController {

    // MARK: - Properties
    
    private let searchButton = UIButton()
    private let welcomeUserView = WelcomeUserView()
    
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
        view.backgroundColor = .white
        
        searchButton.setImage(UIImage.iconSearch, for: .normal)
    }
    
    private func addSubviewsAndConstraints() {
        view.addSubview(searchButton)
        searchButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(48)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(48)
            make.height.width.equalTo(32)
        }
        
        view.addSubview(welcomeUserView)
        welcomeUserView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaInsets.top).offset(80)
            make.right.equalToSuperview().offset(-24)
        }
    }
}

