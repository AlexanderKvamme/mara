//
//  UpCountingLabel.swift
//  mara
//
//  Created by Alexander Kvamme on 08/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation
import UIKit

final class UpCountingLabel: UILabel {
    
    // MARK: - Properties
    
    private var targetNumber: Int

    // MARK: - Initializers
    
    init(number: Int) {
        targetNumber = number
        
        super.init(frame: .zero)
        
        font = UIFont(name: "Nunito-Regular", size: 60)
        backgroundColor = .yellow
        textAlignment = .center
        text = "0"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
