//
//  MyCell.swift
//  mara
//
//  Created by Alexander Kvamme on 22/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation
import UIKit
import SnapKit



extension UIFont {
    
    enum DinFontWeight {
        case regular
        case light
        case medium
        case bold
        case black
    }
    
    static func din(weight: DinFontWeight, size: CGFloat) -> UIFont {
        let name = fontName(forWeight: weight)
        return UIFont(name: name, size: size)!
    }
    
    private static func fontName(forWeight weight: DinFontWeight) -> String {
        switch weight {
        case .light:
            return "DINRoundPro-Light"
        case .black:
            return "DINRoundPro-Black"
        case .medium:
            return "DINRoundPro-Medi"
        case .bold:
            return "DINRoundPro-Bold"
        case .regular:
            return "DINRoundPro"
        }
    }
}

final class MyCell: UITableViewCell {
    
    // MARK: Properties
    
    static let reuseIdentifier = "MyCell"
    
    private let headerLabel = UILabel()
    private let numberLabel = UILabel()
    private let percentageView = PercentageView(frame: CGRect(x: 0, y: 0, width: Screen.width - 64, height: 20))
    
    // MARK: Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        
        headerLabel.text = "hello"
        headerLabel.font = UIFont.din(weight: .medium, size: 24)
        headerLabel.alpha = 0.2
        
        numberLabel.text = "48"
        numberLabel.font = UIFont.din(weight: .black, size: 36)
        
        contentView.addSubview(headerLabel)
        headerLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(32)
            make.left.equalToSuperview().offset(32)
        }
        
        contentView.addSubview(numberLabel)
        numberLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-32)
            make.top.bottom.equalToSuperview()
        }
        
        contentView.addSubview(percentageView)
        percentageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(PercentageView.insets)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        contentView.snp.makeConstraints { (make) in
            make.height.equalTo(100)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 100)
    }

    // MARK: Internal methods
    
    func update(with item: RateItem) {
        numberLabel.text = String(item.rating)
        headerLabel.text = item.title
    }
    
    func animate(item: RateItem) {
        percentageView.animate(to: item.rating)
    }
}
