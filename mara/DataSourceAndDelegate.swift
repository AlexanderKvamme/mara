//
//  DataSourceAndDelegate.swift
//  mara
//
//  Created by Alexander Kvamme on 22/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation
import UIKit

final class Device {
    static let height = UIScreen.main.bounds.height
    static let width = UIScreen.main.bounds.width
    static var hasNotch: Bool = {
        UIApplication.shared.windows.filter{$0.isKeyWindow}.first!.safeAreaInsets.top > 20
    }()
    
    static let notchHeight: CGFloat = {
        return UIApplication.shared.windows.filter{$0.isKeyWindow}.first!.safeAreaInsets.top
    }()
}

final class DataSourceAndDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties

    let items = RateGroup.mocks
    
    // MARK: Sections and rows
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section].items[indexPath.row]
        let cell = MyCell(style: .default, reuseIdentifier: MyCell.reuseIdentifier)
        cell.update(with: item)
        cell.animate(item: item)
        
        return cell
    }
    
    // Headers
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = GroupSectionHeader()
        header.update(with: items[section])
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return GroupSectionHeader.size.height
    }
    
    // Footers
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = Footer()
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return GroupSectionHeader.size.height
    }
}

final class Footer: UIView {
    
    // MARK: Properties
    
    private var plusButton = UIButton(frame: .zero)
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addSubviewsAndConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods
    
    @objc
    private func showNewRatingPage() {
        let newRatingController = NewRatingController()
        Router.push(newRatingController)
    }
    
    private func setup() {
        plusButton.addTarget(self, action: #selector(showNewRatingPage), for: .touchUpInside)
    }
    
    private func addSubviewsAndConstraints() {
        let plusIcon = UIImage.buttonPlus
        plusButton.setImage(plusIcon, for: .normal)
        addSubview(plusButton)
        plusButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-16)
        }
    }
}

