//
//  AddItemsVC.swift
//  List Of Plan
//
//  Created by admin on 20.11.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import RealmSwift

class AddItemsVC: UIViewController {
    
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var newItemTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newItemTextField.becomeFirstResponder()
        datePicker.preferredDatePickerStyle = .wheels
    }
    
    @IBAction func addItemBtn(_ sender: Any) {
        
        if let newName = newItemTextField.text, !newName.isEmpty {
            let newItem = Items()
            newItem.name = newName
            newItem.date = datePicker.date
            newItem.completed = false
            DBManager.sharedInstance.addData(object: newItem)
            print("DONE \(newItem.name)")
            print("DONE \(newItem.date)")
        }
    }
}
