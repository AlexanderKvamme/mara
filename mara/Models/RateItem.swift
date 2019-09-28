//
//  RateItem.swift
//  mara
//
//  Created by Alexander Kvamme on 08/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation

typealias Rating = Int64

// MARK: - RateItem

struct RateItem {
    var title: String
    var id: Int64?
    var rating: Rating
    var dateCreated: Date
//    var category: RateGroup
    
    static var mock = RateItem(title: "En ting", rating: 50, dateCreated: Date())
    static var mocks = [RateItem(title: "En annen ting", rating: 40, dateCreated: Date()),
                           RateItem(title: "Flere ting", rating: 60, dateCreated: Date()),
                           RateItem(title: "Siste ting", rating: 80, dateCreated: Date())]
}

// MARK: - RateGroup

struct RateGroup {
    var title: String
    var items: [RateItem]
    
    static var mock = RateGroup(title: "Mock Group Title", items: [])
    static var mocks = [RateGroup(title: "Lett international", items: RateItem.mocks),
                        RateGroup(title: "McDonalds hamburgers", items: RateItem.mocks),
                        RateGroup(title: "Internasjonale nudler", items: RateItem.mocks)]
    
    private static var mockItems = [RateItem(title: "Item 1", rating: 11, dateCreated: Date())]
}

