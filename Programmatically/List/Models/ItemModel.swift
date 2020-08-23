//
//  ItemModel.swift
//  Programmatically
//
//  Created by Satyadev Chauhan on 22/08/20.
//  Copyright © 2020 Satyadev Chauhan. All rights reserved.
//

import UIKit
import RealmSwift

// MARK: - ItemModel

class ItemModel: Object, Codable {
    @objc dynamic var primary = UUID().uuidString
    @objc dynamic var id: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var date: String? = nil
    @objc dynamic var data: String? = nil

    var kind: ItemType {
        return ItemType(rawValue: type) ?? .other
    }
    
    override static func primaryKey() -> String? { return "primary" }
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case date
        case data
    }

}

// MARK: - ItemType

enum ItemType: String, Codable, CaseIterable {
    case image = "image"
    case other = "other"
    case text = "text"
}
