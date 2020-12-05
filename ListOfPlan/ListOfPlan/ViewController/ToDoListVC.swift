//
//  TableViewController.swift
//  ListOfPlan
//
//  Created by admin on 20.06.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import RealmSwift


class ToDoListVC: UITableViewController {
    
    var toDoItems: Results<Items>!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        //tableView.reloadData()
    }

    
    
    
//    @IBAction func editAction(_ sender: Any) {
//        tableView.setEditing(!tableView.isEditing, animated: true)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//            self.tableView.reloadData()
//        }
//    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let item = toDoItems[indexPath.row]
        
        cell.textLabel?.text = item.name
       // cell.detailTextLabel?.text = "4 Dec 03:03"
        
        
        if (item.completed) == true  {
            cell.imageView?.image = #imageLiteral(resourceName: "check")
        } else {
           cell.imageView?.image = #imageLiteral(resourceName: "uncheck")
        }
        
        if tableView.isEditing {
            cell.textLabel?.alpha = 0.4
            cell.imageView?.alpha = 0.4
        } else {
            cell.textLabel?.alpha = 1
            cell.imageView?.alpha = 1
        }
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        DBManager.sharedInstance.deleteFromDb(object: toDoItems[indexPath.row])
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        
        if DBManager.sharedInstance.completedFromDB(object: toDoItems[indexPath.row]) {
            
            tableView.cellForRow(at: indexPath)?.imageView?.image = #imageLiteral(resourceName: "check")
        } else {
            tableView.cellForRow(at: indexPath)?.imageView?.image = #imageLiteral(resourceName: "uncheck")
        }
        //tableView.reloadRows(at: [indexPath], with: .automatic)
    }
        

//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//        
//        moveItem(fromIndex: fromIndexPath.row, toIndex: to.row)
//        tableView.reloadData()
//    }
//
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {

        if tableView.isEditing {
            return .none
        } else {
             return .delete
        }
    }

    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
