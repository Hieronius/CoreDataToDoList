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
    
    
    
    
    // MARK: - TableView methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
}


