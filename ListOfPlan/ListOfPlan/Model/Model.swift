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

class Items : Codable {
    let name : String?
    var completed : Bool?
    
    init(name : String,completed : Bool) {
        self.name = name
        self.completed = completed
    }
}

var toDoItems = [Items]()


func addItem(nameItem : String, isCompleted : Bool = false)  {
    toDoItems.append(Items(name: nameItem, completed: isCompleted))
    saveData()
    setBadge()
}

func removeItem(at Index : Int) {
    toDoItems.remove(at: Index)
    saveData()
    setBadge()
}

func moveItem(fromIndex: Int, toIndex: Int) {
    let from = toDoItems[fromIndex]
    toDoItems.remove(at: fromIndex)
    toDoItems.insert(from, at: toIndex)
    saveData()
    setBadge()
}

func changeState(at item: Int) -> Bool {
    toDoItems[item].completed = !(toDoItems[item].completed!)
    saveData()
    setBadge()
    return toDoItems[item].completed!
}

func saveData() {
    UserDefaults.standard.set(try? PropertyListEncoder().encode(toDoItems), forKey: "toDo")
}

func loadData() {
    if let data = UserDefaults.standard.value(forKey: "toDo") as? Data {
        let item = try? PropertyListDecoder().decode(Array<Items>.self, from: data)
        toDoItems = item!
    }
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

