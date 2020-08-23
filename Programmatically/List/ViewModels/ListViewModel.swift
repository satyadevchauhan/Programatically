//
//  ListViewModel.swift
//  Programmatically
//
//  Created by Satyadev Chauhan on 22/08/20.
//  Copyright © 2020 Satyadev Chauhan. All rights reserved.
//

import UIKit
import RealmSwift

class ListViewModel {
    
    var name = "List".localized
    var filterType: ItemType? = nil
    var showLoading: (() -> Void)?
    var hideLoading: (() -> Void)?
    var dataLoaded: (() -> Void)?
    var alert: ((String, String) -> Void)?
    
    var list: [ItemModel]?
    
    var alllist: [ItemModel]?
    
    var filterOptions: [ItemType] {
        return ItemType.allCases
    }
    
    init() {
        loadList()
    }
    
    func getList() {
        showLoading?()
        ListEndPoint.getList { [weak self] (result) in
            switch result {
            case .success(let list):
                self?.alllist = list
                self?.filter(type: self?.filterType)
                self?.saveList()
            case .failure(let error):
                self?.alert?("Error".localized, error.localizedDescription)
            }
            
            self?.hideLoading?()
            self?.dataLoaded?()
        }
    }
    
    func filter(type: ItemType? = nil) {
        filterType = type
        if let type = type {
            list = alllist?.filter({ $0.kind == type })
            name = String(format: "ListParam".localized, type.rawValue.capitalized)
        } else {
            list = alllist
            name = "List".localized
        }
        
        dataLoaded?()
    }
}

// MARK: - Database Operations

extension ListViewModel {
    
    func saveList() {
        
        guard let list = alllist else { return }

        let database = Database()
        database.deleteAll()
        database.add(list, update: .all)
    }
    
    func loadList() {
        let database = Database()
        if let items = database.objects(ItemModel.self) {
            alllist = Array(items)
            filter(type: filterType)
        }
    }
    
}
