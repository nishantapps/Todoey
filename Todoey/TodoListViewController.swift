//
//  ViewController.swift
//  Todoey
//
//  Created by Nishant Rai on 15/04/18.
//  Copyright © 2018 Nishant Rai. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    var itemArray = [""]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let items = defaults.array(forKey: "ToDoList") as? [String] {
            itemArray = items
        }
    }

 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }

    
    //MARK - table View delegate method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Alert add item
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add an item to your list", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add an item", style: .default) { (action) in
            
            self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray, forKey: "ToDoList")
            
          self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add a new item"
            textField = alertTextField
            print("item added")
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
   
    
    
    

}

