//
//  RateItem.swift
//  mara
//
//  Created by Alexander Kvamme on 08/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation

typealias Rating = Int

struct RateItem {
    var title: String
    var rating: Rating
//    var category: RateGroup
    
    static var mock = RateItem(title: "Mock Title", rating: 50)
    static var mocks = [RateItem(title: "Mock Title 1", rating: 40),
                           RateItem(title: "Mock Title 2", rating: 60),
                           RateItem(title: "Mock Title 3", rating: 80)]
}

struct RateGroup {
    var title: String
    var items: [RateItem]
    
    static var mock = RateGroup(title: "Mock Group Title", items: [])
    static var mocks = [RateGroup(title: "First Mock Group Title", items: RateItem.mocks),
                        RateGroup(title: "Second Mock Group Title", items: RateItem.mocks),
                        RateGroup(title: "Second Mock Group Title", items: RateItem.mocks)]
    
    private static var mockItems = [RateItem(title: "Item 1", rating: 11)]
}


