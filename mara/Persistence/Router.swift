//
//  Router.swift
//  mara
//
//  Created by Alexander Kvamme on 06/10/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation
import UIKit

final class Router {
    
    // MARK: Properties
    
    static var navigationController = UINavigationController()
    
    // MARK: Initializers
    
    init(viewController: UIViewController) {
        Router.navigationController.setViewControllers([viewController], animated: true)
    }
    
    static func push(_ vc: UIViewController) {
        navigationController.pushViewController(vc, animated: true)
    }
    
    @objc static func pop() {
        navigationController.popViewController(animated: true)
    }
}
