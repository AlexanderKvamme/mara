//
//  Navbar.swift
//  mara
//
//  Created by Alexander Kvamme on 06/10/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation
import UIKit

struct Screen {
    static var width: CGFloat = { return UIScreen.main.bounds.width }()
    static var height: CGFloat = { return UIScreen.main.bounds.height }()
    
}

final class AKNavigationBar: UIView {
    
    // MARK: Properties
    
    var leftButton = UIButton()
    private var title = UILabel()
    private var rightButton = UIButton()
    
    // MARK: Initializers
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: Screen.width, height: 100))
        setup()
        addSubviewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods
    
    private func setup() {
        title.textAlignment = .center
        title.textColor = .black
        title.font = UIFont.din(weight: .bold, size: 24)
        
        leftButton.tintColor = .black
    }
    
    private func addSubviewsAndConstraints() {
        [leftButton, title, rightButton].forEach({ addSubview($0) })
        
        leftButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.size.equalTo(48)
            make.left.equalToSuperview().offset(8)
        }
        
        title.snp.makeConstraints { (make) in
            make.left.equalTo(leftButton.snp.right).offset(8)
            make.right.equalTo(rightButton.snp.left).offset(-8)
            make.centerY.equalToSuperview()
        }
        
        rightButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-8)
            make.size.equalTo(48)
        }
    }
    
    // MARK: Internal methods
    
    func setTitle(_ title: String) {
        self.title.text = title
    }
}
