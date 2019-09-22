//
//  GroupSectionHeader.swift
//  mara
//
//  Created by Alexander Kvamme on 22/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation
import UIKit


final class GroupSectionHeader: UIView {
    
    // MARK: Properties
    
    static var size = CGSize(width: Screen.width, height: 140)
    
    private let header = UILabel.sectionHeader
    private var colorView = UIView.obtuseView
    private var categoryIcon = UIImageView.with(image: .iconCoffee)
    private let separator = UIView()
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(origin: .zero, size: GroupSectionHeader.size))
        
        setup()
        addSubviewsAndConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        separator.backgroundColor = .black
        separator.alpha = 0.05
        separator.layer.cornerRadius = 5
        
        
    }
    
    private func addSubviewsAndConstraints() {
        let horizontalInsets = 16
        
        addSubview(header)
        header.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(32)
        }
        
        addSubview(colorView)
        colorView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(-24)
            make.bottom.equalTo(header.snp.bottom)
            make.width.equalTo(160)
            make.height.equalTo(24)
        }
        sendSubviewToBack(colorView)
        
        addSubview(categoryIcon)
        categoryIcon.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-40)
            make.bottom.equalTo(header).offset(-8)
        }
        
        addSubview(separator)
        separator.snp.makeConstraints { (make) in
            make.height.equalTo(5)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(horizontalInsets)
            make.right.equalToSuperview().offset(-horizontalInsets)
        }
        separator.alpha = 0
    }
    
    // MARK: Private methods
    
    func update(with group: RateGroup)  {
        header.text = group.title
        colorView.backgroundColor = UIColor.mara.softYellow
    }
}

extension UIView {
    static var obtuseView: UIView {
        let view = UIView()
        view.backgroundColor = .black
        view.transform = CGAffineTransform(rotationAngle: CGFloat.pi/12)
        view.alpha = 0.3
        return view
    }
}

extension UILabel {
    static var sectionHeader: UILabel {
        let label = UILabel()
        label.font = UIFont.din(weight: .bold, size: 24)
        return label
    }
}

extension UIImageView {
    static func with(image: UIImage) -> UIImageView {
        let imageView = UIImageView(image: image)
        return imageView
    }
}
