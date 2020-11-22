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
  
    var item : Items?
    
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var newItemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newItemTextField.becomeFirstResponder()
    }
    
    @IBAction func addItemBtn(_ sender: Any) {
        if let item = item, let newItem = newItemTextField.text {
            try! DataBaseManager.sharedDB.dataBase.write {
                item.name = newItem
            }
        }
    }
}
