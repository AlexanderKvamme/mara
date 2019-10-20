//
//  NewRatingController.swift
//  mara
//
//  Created by Alexander Kvamme on 24/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation
import UIKit


extension UILabel {
    
    static func header(_ value: String) -> UILabel {
        let label = UILabel()
        label.text = value
        label.font = UIFont.din(weight: .bold, size: 16)
        label.textColor = .black
        label.alpha = 0.1
        return label
    }
    
    static func massive(_ value: String) -> UILabel {
        let label = UILabel()
        label.text = value
        label.font = UIFont.din(weight: .black, size: 80)
        label.textColor = .black
        return label
    }
}

extension UITextField {
    
    static func big(placeholder value: String) -> UITextField {
        let tf = UITextField()
        tf.placeholder = value
        tf.font = UIFont.din(weight: .bold, size: 32)
        tf.textColor = .black
        return tf
    }
}

final class NewRatingController: UIViewController {
    
    // MARK: Properties
    
    private let navBar = AKNavigationBar()
    private let titleHeader = UILabel.header("Name")
    private let titleTextField = UITextField.big(placeholder: "Enter your title here")
    private let groupHeader = UILabel.header("Group")
    private let groupTextField = UITextField.big(placeholder: "Enter your group name here")
    private let ratingSlider = PercentageView(frame: CGRect(x: 100, y: 100, width: Device.width - 64, height: 20))
    private let ratingLabel = UILabel.massive("50")
    
    // MARK: Initializers
    
    override func viewWillAppear(_ animated: Bool) {
        setup()
        addSubviewsAndConstraints()
    }
    
    // MARK: Private methods
    
    private func setup() {
        view.backgroundColor = .white
        
        let leftIcon = UIImage.iconBoxedCross.withTintColor(.magenta)
        navBar.leftButton.setImage(leftIcon, for: .normal)
        navBar.leftButton.addTarget(Router.self, action: #selector(Router.pop), for: .touchUpInside)
        
        navBar.setTitle("Add new rating")
        
        titleTextField.delegate = self
        groupTextField.delegate = self
        
        ratingSlider.addTouchFunctionality(withDelegate: self)
    }
    
    private func addSubviewsAndConstraints() {
        [navBar, titleHeader, titleTextField, groupHeader, groupTextField, ratingSlider, ratingLabel].forEach({ view.addSubview($0) })

        navBar.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Device.notchHeight)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }

        titleHeader.snp.makeConstraints { (make) in
            make.top.equalTo(navBar.snp.bottom).offset(48)
            make.right.equalToSuperview()
            make.left.equalToSuperview().offset(16)
        }
        
        titleTextField.snp.makeConstraints { (make) in
            make.top.equalTo(titleHeader.snp.bottom)
            make.right.equalToSuperview()
            make.left.equalToSuperview().offset(16)
        }
        
        groupHeader.snp.makeConstraints { (make) in
            make.top.equalTo(titleTextField.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview()
        }
        
        groupTextField.snp.makeConstraints { (make) in
            make.top.equalTo(groupHeader.snp.bottom)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview()
        }
        
        ratingLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-80)
            make.centerX.equalToSuperview()
        }
        
        ratingSlider.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.height.equalTo(40)
        }
        
        ratingSlider.animate(to: 50)
    }
}

extension NewRatingController: RatingSliderDelegate {
    
    
    
    func ratingSwipeDidBegin() {
        let scale: CGFloat = 1.2
        UIView.animate(withDuration: 0.1) {
            self.ratingLabel.transform = CGAffineTransform.identity.scaledBy(x: scale, y: scale).rotated(by: -0.01)
        }
    }
    
    func ratingDidChange(to rating: Rating) {
        ratingLabel.text = rating.description
        ratingSlider.set(rating)
    }
    
    func ratingSwipeDidEnd() {
        UIView.animate(withDuration: 0.1) {
            self.ratingLabel.transform = CGAffineTransform.identity
        }
    }
}

extension NewRatingController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === self.titleTextField {
            groupTextField.becomeFirstResponder()
        } else if textField === self.groupTextField {
            // TODO: Make confirmation view
            guard
                let title = titleTextField.text,
                let ratingText = ratingLabel.text,
                let rating = Int64(ratingText) else {
                    // TODO: verify group name, and show error to user
                    log.error("Insufficient data to create rateItem")
                    return true
            }
            
            let newRateItem = RateItem(title: title, id: nil, rating: rating, dateCreated: Date())
            database.create(item: newRateItem)
            Router.pop()
        }
        
        return true
    }
}
