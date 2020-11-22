//
//  Model.swift
//  ListOfPlan
//
//  Created by admin on 20.06.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit
import RealmSwift

class Items : Object {
    @objc dynamic var name = ""
    @objc dynamic var completed = false
}

var realm: Realm!

var toDoItems: Results<Items>{
    get {
      return realm.objects(Items.self)
    }
}


func removeItem(at Index : Int) {
    try! realm!.write {
        realm!.delete(toDoItems)
    }
    setBadge()
}

//func moveItem(fromIndex: Int, toIndex: Int) {
//    let from = toDoItems[fromIndex]
//    toDoItems.remove(at: fromIndex)
//    toDoItems.insert(from, at: toIndex)
//    setBadge()
//}

func changeState(at item: Int) -> Bool {
    toDoItems[item].completed = !(toDoItems[item].completed)
    setBadge()
    return toDoItems[item].completed
}


//MARK: - Notification
func requestForNotification( ) {
    UNUserNotificationCenter.current().requestAuthorization(options: .badge) { (isEnabled, error) in
    }
}

func setBadge( ) {
    var totalBadgeNumber = 0
    for i in toDoItems {
        if (i.completed) == false {
            totalBadgeNumber += 1
        }
    }
    UIApplication.shared.applicationIconBadgeNumber = totalBadgeNumber
}

