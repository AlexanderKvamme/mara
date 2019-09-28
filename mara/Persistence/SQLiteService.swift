//
//  SQLiteService.swift
//  mara
//
//  Created by Alexander Kvamme on 28/09/2019.
//  Copyright © 2019 Alexander Kvamme. All rights reserved.
//

import Foundation
import SQLite


final class SQLiteService: PersistenceService {
    
    // MARK: Properties
    
    var database: Connection!
    
    // MARK: Initializers
    
    init() {
        prepare()
        
        if inDebugMode {
            deleteAllRecords()
            createTables()
            seedMocks()
        }
        
        dump()
    }
    
    // MARK: Private methods
    
    private func prepare() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
             
        do {
            let db = try Connection("\(path)/db.sqlite3")
            database = db
            log.debug("successfully connected to a database")
        } catch let error {
            log.error(error)
        }
    }
    
    private func createTables() {
        guard !tableExists("rateitems") else { return }
    
        do {
            try database.run("""
            CREATE TABLE rateitems(
            id integer PRIMARY KEY NOT NULL,
            title TEXT NOT NULL,
            rating integer NOT NULL,
            ts DATE NOT NULL DEFAULT (datetime('now')));
            """)
        } catch let error {
            log.error(error)
        }
    }
    
    private func deleteAllRecords() {
        do {
            try database.run("DELETE FROM rateitems")
            try database.run("DROP TABLE rateitems")
        } catch let error {
            log.error(error)
        }
    }
    
    private func seedMocks() {
        RateItem.mocks.forEach({ create(item: $0) })
    }
    
    // MARK: Helper methods
    
    private func tableExists(_ tableName: String) -> Bool {
        let table = Table(tableName)
        do {
            let _ = try database!.scalar(table.exists)
            return true
        } catch {
            return false
        }
    }
    
    private static func makeUTCDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        return dateFormatter
    }
    
    // MARK: Internal methods
    
    func create(item: RateItem) {
        do {
            try database.run("INSERT INTO rateitems (title, rating) VALUES (?, ?)", item.title, item.rating)
        } catch let error {
            log.error(error)
        }
    }
    
    func retrieve(id: RateItemID) -> RateItem? {
        var result: RateItem? = nil
        
        do {
            let stmt = try database.run("SELECT * FROM rateitems WHERE id == ?", id)
            for row in stmt {
                guard
                    let id = row[0] as? Int64,
                    let title = row[1] as? String,
                    let rating = row[2] as? Int64,
                    let date = SQLiteService.deserialize(row[3] as? String)
                    else {
                        fatalError("could not unwrap needed values to initialize SPhoto")
                }
                
                result = RateItem(title: title, id: id, rating: rating, dateCreated: date)
            }
        } catch let error {
            log.error(error)
        }
        
        return result
    }
    
    func update(item: RateItem) {
        log.debug("would update")
    }
    
    func delete(_ item: RateItem) {
        log.debug("would delete")
    }
    
    func dump() {
        do {
            let stmt = try database.run("SELECT * FROM rateitems")
            stmt.forEach({ log.debug("logging rateitem: \($0)") })
        } catch let error {
            log.error(error)
        }
    }
    
    // MARK: - Static methods
    
    fileprivate static func deserialize(_ UTCdateString: String?) -> Date? {
        guard let dateString = UTCdateString, let result = makeUTCDateFormatter().date(from: dateString) else {
            return nil
        }
        
        return result
    }
}

