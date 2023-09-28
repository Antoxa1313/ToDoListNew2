//
//  TaskViewController.swift
//  ToDoListNewProject
//
//  Created by Anton Nepotenko on 2023-09-14.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TaskTableViewCellDelegate {
    func didTapStatusButton(cell: TaskTableViewCell) {
       
    }
    

    var tasks = [Task]()
    var users = [User]()
   var userIndex = Int ()
//    var tasks =

//     [
//         Task(cellTitle: "Create app", cellDescription: "ios app", cellDeadline: "2024/10/12", cellStatus: "In progress"),
//            Task(cellTitle: "Sign the lease", cellDescription: "Rental agreement", cellDeadline: "2024/10/12", cellStatus: "Todo"),
//            Task(cellTitle: "Options system", cellDescription: "Trading system", cellDeadline: "2024/10/12", cellStatus: "In progress"),
//            Task(cellTitle: "Fix Iphone", cellDescription: "Broken screen", cellDeadline: "2024/10/12", cellStatus: "Todo"),
//            Task(cellTitle: "Multifamily", cellDescription: "Property", cellDeadline: "2024/10/12", cellStatus: "Todo")
//        ]

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell

        cell.cellTitle?.text = tasks[indexPath.row].cellTitle
        cell.cellDescription?.text = tasks[indexPath.row].cellDescription
        cell.cellDeadline?.text = tasks[indexPath.row].cellDeadline
        cell.tappedStatusBarOutlet?.setTitle(tasks[indexPath.row].cellStatus, for: .normal)
        
        switch tasks[indexPath.row].cellStatus {
            
        case "In Progress":
            cell.tappedStatusBarOutlet.backgroundColor = .systemOrange
            
        case "To Do":
            cell.tappedStatusBarOutlet.backgroundColor = .systemRed
            
        case "Done":
            cell.tappedStatusBarOutlet.backgroundColor = .systemGreen
            
        default:
            break
        }
        
        cell.delegate = self
        return cell
    }


    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       let nib = UINib(nibName: "TaskTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TaskTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        //Setup
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
            
            updateTasks()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        users = UserDefaultsManager.shared.getUsers() ?? [User]()
        tasks = users[userIndex].task ?? [Task]()
        
        tableView.reloadData()
    }

    func updateTasks(){
        
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        for x in 0..<count {
            if let task = UserDefaults().value(forKey: "task_\(x+1)") as? Task{
                tasks.append(task)
            }
        }
        tableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "detail") as! TaskDetailViewController
//        vc2.update = {
//            DispatchQueue.main.async {
//                self.updateTasks()
//            }
//        }
            self.navigationController?.pushViewController(vc2, animated: true)
        
    }
    
    
    
}
