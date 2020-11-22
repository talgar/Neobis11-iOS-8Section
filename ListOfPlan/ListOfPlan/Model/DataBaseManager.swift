//
//  DataBaseManager.swift
//  List Of Plan
//
//  Created by admin on 23.11.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import RealmSwift

class DataBaseManager {
    var dataBase : Realm!
    static let sharedDB = DataBaseManager()
    
    private init() {
        dataBase = try! Realm()
    }
    
    func getDataFDB() -> Results<Items> {
        let results : Results<Items> = dataBase.objects(Items.self)
        return results
    }
    
    func addData(object : Items) {
        try! dataBase.write {
            dataBase.add(object)
        }
    }
    
    func deleteFDB(object : Items) {
        try! dataBase.write {
            dataBase.delete(object)
        }
    }
}
