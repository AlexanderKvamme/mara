//
//  RecentExperiencesView.swift
//  mara
//
//  Created by Alexander Kvamme on 08/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation
import UIKit

final class HeaderLabel: UILabel {
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        font = UIFont(name: "Nunito-Regular", size: 60)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


final class RecentExperiencesView: UIView {
    
    // MARK: - Properties
    
    private var header = HeaderLabel()
    private var counter: UpCountingLabel
    private var subheader = HeaderLabel()
    private var endValue: Int
    
    // MARK: - Initializer
    
    init(number: Int) {
        self.counter = UpCountingLabel(number: number)
        self.endValue = number
        
        super.init(frame: .zero)

        setup()
        
        addSubview(header)
        header.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
        
        addSubview(counter)
        counter.snp.makeConstraints { (make) in
            make.top.equalTo(header.snp.bottom)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        addSubview(subheader)
        subheader.snp.makeConstraints { (make) in
            make.top.equalTo(counter.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setup() {
        header.text = "Header"
        header.textAlignment = .center
        header.sizeToFit()
        
        subheader.text = "Subheader"
        subheader.textAlignment = .center
        subheader.sizeToFit()
        
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: .default)
    }
    
    @objc private func handleUpdate() {
        let animationDurationInSeconds = 1
        let step = endValue/animationDurationInSeconds/60
        let currentValue = Int(counter.text ?? "-99") ?? -99
        
        counter.text = String(min(currentValue+step, endValue))
    }
}
