//
//  PercentageView.swift
//  mara
//
//  Created by Alexander Kvamme on 22/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation
import UIKit


final class PercentageView: UIView {
    
    // MARK: Properties
    
    static let insets: CGFloat = 32
    private let filledPortion = UIView()
    private let unfilledPortion = UIView()
    
    private var rating: Rating?
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addSubviewsAndConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    private func setup() {
        filledPortion.backgroundColor = .black
        filledPortion.layer.cornerRadius = 5
        unfilledPortion.backgroundColor = .black
        unfilledPortion.layer.cornerRadius = 5
        unfilledPortion.alpha = 0.05
    }
    
    private func addSubviewsAndConstraints() {
        addSubview(unfilledPortion)
        addSubview(filledPortion)
    }
    
    // MARK: Internal methods
    
    func set(_ rating: Rating) {
        self.rating = rating
        
        #warning("clean or remove me")
        
        let width: CGFloat               = frame.size.width
        let percentageInWidth: CGFloat   = width/100*CGFloat(rating)
        let barheight: CGFloat           = 10
        let barSpacing: CGFloat          = 10
        
        let unfilledWidth = width - percentageInWidth - barSpacing
        unfilledPortion.frame.size = CGSize(width: unfilledWidth, height: barheight)
        unfilledPortion.frame.origin = CGPoint(x: filledPortion.frame.maxX + barheight, y: filledPortion.frame.minY)
        filledPortion.frame.size = CGSize(width: percentageInWidth, height: barheight)
    }
    
    func reset() {
        let width: CGFloat               = frame.size.width
        let percentageInWidth: CGFloat   = 0
        let barheight: CGFloat           = 10
        let barSpacing: CGFloat          = 10
        
        let unfilledWidth = width - percentageInWidth - barSpacing
        unfilledPortion.frame.size = CGSize(width: unfilledWidth, height: barheight)
        unfilledPortion.frame.origin = CGPoint(x: filledPortion.frame.maxX + barheight, y: filledPortion.frame.minY)
        filledPortion.frame.size = CGSize(width: percentageInWidth, height: barheight)
    }
    
    func animate(to rating: Rating) {
        reset()
        
        UIView.animate(withDuration: 0.8) {
            self.filledPortion.frame = CGRect(x: 0, y: 0,
                                              width: self.width(for: rating),
                                              height: self.filledPortion.frame.height)
            
            let newWidth = self.maxWidth - self.width(for: rating) - 10
            self.unfilledPortion.frame = CGRect(x: Screen.width-PercentageView.insets*2 - newWidth, y: 0,
                                                width: newWidth,
                                                height: self.unfilledPortion.frame.height)
            
            self.filledPortion.setNeedsLayout()
            self.unfilledPortion.setNeedsLayout()
        }
    }
    
    var maxWidth: CGFloat {
        return Screen.width - 2*PercentageView.insets
    }
    
    private func width(for rating: Rating) -> CGFloat {
        let max = Screen.width - 2*PercentageView.insets
        return max/100*CGFloat(rating)
    }
}
