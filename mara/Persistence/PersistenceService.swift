//
//  PersistenceService.swift
//  mara
//
//  Created by Alexander Kvamme on 26/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation

typealias RateItemID = Int64


protocol PersistenceService {
    // CRUD
    func create(item: RateItem)
    func retrieve(id: RateItemID) -> RateItem?
    func update(item: RateItem)
    func delete(_ item: RateItem)
    
    func dump()
}

