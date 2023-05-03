//
//  TableViewController.swift
//  CoreDataToDoList
//
//  Created by Арсентий Халимовский on 02.05.2023.
//

import UIKit

final class TableViewController: UITableViewController {
    
    // MARK: - Private Properties
    
    private var tasks = [String]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code here
    }
    
    // MARK: - IBActions
    
    
    @IBAction func addTaskAction(_ sender: UIButton) {
        
        let ac = UIAlertController(title: "New task", message: "Write your task", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Save", style: .default) { action in
            let textField = ac.textFields?.first
            
            if let newTask = textField?.text {
                // add task to the beginning of the list
                self.tasks.insert(newTask, at: 0)
                self.tableView.reloadData()
                // or use tableViewCell.insert method
            }
        }
        
        ac.addTextField()
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        ac.addAction(action)
        ac.addAction(cancelAction)
        
        self.present(ac, animated: true)
    }
    
    
    // MARK: - TableView methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
}


