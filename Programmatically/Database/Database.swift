//
//  Database.swift
//  Programmatically
//
//  Created by Satyadev Chauhan on 23/08/20.
//  Copyright © 2020 Satyadev Chauhan. All rights reserved.
//

import Realm
import RealmSwift

class Database {
    
    func perform(action: () -> Void) {
        do {
            let realm = try Realm()
            realm.refresh()
            try realm.write {
                action()
            }
        } catch {
            print("Error: \(error)")
        }
    }
}

// MARK: - Config

extension Database {

    func configureRealm() {
        let config = RLMRealmConfiguration.default()
        config.deleteRealmIfMigrationNeeded = true
        RLMRealmConfiguration.setDefault(config)
    }
}

// MARK: - Get Object

extension Database {
    
    func objects<T: Object>(_ type: T.Type, predicate: NSPredicate? = nil) -> Results<T>? {
        do {
            let realm = try Realm()
            realm.refresh()
            return predicate == nil ? realm.objects(type) : realm.objects(type).filter(predicate!)
        } catch {
            print("Error: \(error)")
            return nil
        }
    }

    func object<T: Object>(_ type: T.Type, key: String) -> T? {
        do {
            let realm = try Realm()
            realm.refresh()
            return realm.object(ofType: type, forPrimaryKey: key)
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
}

// MARK: - Add Object

extension Database {
    
    func add<T: Object>(_ data: [T], update: Realm.UpdatePolicy) {
        do {
            let realm = try Realm()
            realm.refresh()
            if realm.isInWriteTransaction {
                realm.add(data, update: update)
            } else {
                try realm.write {
                    realm.add(data, update: update)
                }
            }
        } catch {
            print("Error: \(error)")
        }
    }

    func add<T: Object>(_ data: T, update: Realm.UpdatePolicy) {
        add([data], update: update)
    }
}

// MARK: - Delete Object

extension Database {
    
    func delete<T: Object>(_ data: [T]) {
        do {
            let realm = try Realm()
            realm.refresh()
            try realm.write {
                realm.delete(data)
            }
        } catch {
            print("Error: \(error)")
        }
    }

    func delete<T: Object>(_ data: T) {
        delete([data])
    }

    func deleteAll() {
        do {
            let realm = try Realm()
            realm.refresh()
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
