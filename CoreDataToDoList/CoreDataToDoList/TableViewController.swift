//
//  TableViewController.swift
//  CoreDataToDoList
//
//  Created by Арсентий Халимовский on 02.05.2023.
//

import UIKit
import CoreData

final class TableViewController: UITableViewController {
    
    // MARK: - Private Properties
    
    private var tasks = [Tasks]()
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        
        do {
            tasks = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
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
                self.saveTask(withTitle: newTask)
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
    
    
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        
        if let tasks = try? context.fetch(fetchRequest) {
            for task in tasks {
                context.delete(task)
            }
        }
    }
    
    
    // MARK: - Private Methods
    
    private func saveTask(withTitle title: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Tasks", in: context) else { return }
        
        let taskObject = Tasks(entity: entity, insertInto: context)
        taskObject.title = title
        
        do {
            try context.save()
            tasks.append(taskObject)
        } catch let error as NSError {
            
        }
    }
    
    // MARK: - TableView methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        
        return cell
    }
}


