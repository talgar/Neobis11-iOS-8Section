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
    @objc dynamic  var name = ""
    @objc dynamic var date: Date = Date()
    @objc dynamic var completed = false
    
}



////MARK: - Notification
//func requestForNotification( ) {
//    UNUserNotificationCenter.current().requestAuthorization(options: .badge) { (isEnabled, error) in
//    }
//}
//
//func setBadge( ) {
//    realm.beginWrite()
//    var toDoItems = Items()
//    var totalBadgeNumber = 0
//    for i in toDoItems {
//        if (i.completed) == false {
//            totalBadgeNumber += 1
//        }
//    }
//    try! realm.commitWrite()
//    UIApplication.shared.applicationIconBadgeNumber = totalBadgeNumber
//}



