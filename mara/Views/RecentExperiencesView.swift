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

        font = UIFont(name: "Nunito-Bold", size: 32)
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
    private lazy var displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
    
    // MARK: - Initializer
    
    init(number: Int) {
        self.counter = UpCountingLabel(number: number)
        self.endValue = number
        
        super.init(frame: .zero)

        setup()
        addSubviewsAndConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setup() {
        // configure labels
        header.text = "Recent experiences"
        header.textAlignment = .center
        header.adjustsFontSizeToFitWidth = true
        header.sizeToFit()
        subheader.text = "in the last 30 days"
        subheader.textAlignment = .center
        subheader.adjustsFontSizeToFitWidth = true
        subheader.sizeToFit()
        counter.adjustsFontSizeToFitWidth = true
        
        // tap to replay animation
        let tapRec = UITapGestureRecognizer(target: self, action: #selector(resetAnimation))
        addGestureRecognizer(tapRec)

        displayLink.add(to: .main, forMode: .default)
    }
    
    private func addSubviewsAndConstraints() {
        addSubview(header)
        header.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.greaterThanOrEqualTo(50)
        }
        
        addSubview(counter)
        counter.snp.makeConstraints { (make) in
            make.top.equalTo(header.snp.bottom)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(60)
        }

        addSubview(subheader)
        subheader.snp.makeConstraints { (make) in
            make.top.equalTo(counter.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
        
        snp.makeConstraints { (make) in
            make.bottom.equalTo(subheader)
        }
    }
    
    @objc private func resetAnimation() {
        counter.text = "0"
        displayLink.add(to: .main, forMode: .default)
    }
    
    @objc private func handleUpdate() {
        let animationDurationInSeconds = 1
        let step = endValue/animationDurationInSeconds/60
        let currentValue = Int(counter.text ?? "-99") ?? -99
        
        counter.text = String(min(currentValue+step, endValue))
        
        if currentValue == endValue {
            displayLink.remove(from: .main, forMode: .default)
        }
    }
}

