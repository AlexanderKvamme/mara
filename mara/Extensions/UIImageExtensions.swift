//
//  UIImageExtensions.swift
//  mara
//
//  Created by Alexander Kvamme on 21/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation
import UIKit


extension UIImage {
    static var iconCoffee = UIImage(named: "icon-coffee")!
    static var iconSearch = UIImage(named: "icon-search")!
    static var buttonPlus = UIImage(named: "button-plus")!
    
    // boxed
    static var iconBoxedPlus = UIImage(named: "boxed icon plus")!.withRenderingMode(.alwaysTemplate)
    static var iconBoxedCross = UIImage(named: "boxed icon cross")!.withRenderingMode(.alwaysTemplate)
    
    // unboxed
    static var iconUnboxedPlus = UIImage(named: "boxed icon plus")!.withRenderingMode(.alwaysTemplate)
    static var iconUnboxedCross = UIImage(named: "unboxed icon cross")!.withRenderingMode(.alwaysTemplate)
}
