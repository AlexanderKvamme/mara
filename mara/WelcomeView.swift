//
//  WelcomeView.swift
//  mara
//
//  Created by Alexander Kvamme on 21/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//


import Foundation
import UIKit


final class WelcomeUserView: UIView {
    
    // MARK: Properties
    
    private let welcomeLabel = UILabel.welcome
    private let nameLabel = UILabel.welcomeName
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviewsAndConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods

    private func addSubviewsAndConstraints() {
        addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(welcomeLabel.snp.bottom)
            make.left.equalTo(welcomeLabel)
            make.right.equalToSuperview()
        }
        
        snp.makeConstraints { (make) in
            make.bottom.equalTo(nameLabel)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let height = welcomeLabel.frame.height + nameLabel.frame.height
        return CGSize(width: max(welcomeLabel.frame.width, nameLabel.frame.width), height: height)
    }
}

extension UILabel {
    
    static var welcome: UILabel {
        let label = UILabel()
        label.text = "Welcome back"
        label.alpha = 0.3
        label.font = UIFont(name: "DINRoundPro-Medi", size: 16)
        label.textAlignment = .right
        return label
    }
    
    static var welcomeName: UILabel {
        let label = UILabel()
        label.text = "Alexander"
        label.font = UIFont(name: "DINRoundPro-Medi", size: 32)
        label.textAlignment = .right
        return label
    }
}
