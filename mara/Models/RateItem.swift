//
//  RateItem.swift
//  mara
//
//  Created by Alexander Kvamme on 08/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation

struct RateGroup {
    var title: String
    var items: [RateItem]
}

typealias Rating = Int

struct RateItem {
    var title: String
    var ratting: Rating
    var category: RateGroup
}

