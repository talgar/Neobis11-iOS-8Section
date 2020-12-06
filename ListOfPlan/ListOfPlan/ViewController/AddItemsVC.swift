//
//  AddItemsVC.swift
//  List Of Plan
//
//  Created by admin on 20.11.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import RealmSwift

class AddItemsVC: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var newItemTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var addBTN: UIButton!
    @IBOutlet weak var cancelBTN: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBTN.layer.cornerRadius = 6
        cancelBTN.layer.cornerRadius = 6
        newItemTextField.becomeFirstResponder()
        date()
    }
    
    @IBAction func addItemBtn(_ sender: Any) {
        
        if let textName = newItemTextField.text, !textName.isEmpty {
            let date = datePicker.date
            
            realm.beginWrite()
            let newItem = Items()
            newItem.name = textName
            newItem.date = date
            newItem.completed = false
            realm.add(newItem)
            try! realm.commitWrite()
        }
    }
    
    func date(){
        let date = Calendar.current.date(byAdding: .year, value: 0, to: Date())
        datePicker.minimumDate = date
        datePicker.preferredDatePickerStyle = .automatic
    }
}
