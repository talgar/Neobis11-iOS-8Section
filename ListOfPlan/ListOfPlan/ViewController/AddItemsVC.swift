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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newItemTextField.becomeFirstResponder()
    }
    
    @IBAction func addItemBtn(_ sender: Any) {
        
        if let newName = newItemTextField.text, !newName.isEmpty {
            let newItem = Items()
            newItem.name = newName
            newItem.completed = false
            DBManager.sharedInstance.addData(object: newItem)
        }
    }
}
