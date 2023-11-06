//
//  TaskViewController.swift
//  ToDoListNewProject
//
//  Created by Anton Nepotenko on 2023-09-14.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TaskTableViewCellDelegate {
    
   
    

    var tasks = [Task]()
    var users = [User]()
   var userIndex = Int ()
    
    
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       let nib = UINib(nibName: "TaskTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TaskTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        //Setup
//        if !UserDefaults().bool(forKey: "setup") {
//            UserDefaults().set(true, forKey: "setup")
//            UserDefaults().set(0, forKey: "count")
//
//            updateTasks()
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        users = UserDefaultsManager.shared.getUsers()
        tasks = users[userIndex].task ?? [Task]()
        
        tableView.reloadData()
        print(userIndex)
        print(users[userIndex].task )
    }
//    var tasks =

//     [
//         Task(cellTitle: "Create app", cellDescription: "ios app", cellDeadline: "2024/10/12", cellStatus: "In progress"),
//            Task(cellTitle: "Sign the lease", cellDescription: "Rental agreement", cellDeadline: "2024/10/12", cellStatus: "Todo"),
//            Task(cellTitle: "Options system", cellDescription: "Trading system", cellDeadline: "2024/10/12", cellStatus: "In progress"),
//            Task(cellTitle: "Fix Iphone", cellDescription: "Broken screen", cellDeadline: "2024/10/12", cellStatus: "Todo"),
//            Task(cellTitle: "Multifamily", cellDescription: "Property", cellDeadline: "2024/10/12", cellStatus: "Todo")
//        ]

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users[userIndex].task?.count ?? 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell

        cell.cellTitle?.text = tasks[indexPath.row].cellTitle
        cell.cellDescription?.text = tasks[indexPath.row].cellDescription
        cell.cellDeadline?.text = tasks[indexPath.row].cellDeadline
        cell.tappedStatusBarOutlet?.setTitle(tasks[indexPath.row].cellStatus, for: .normal)
        
        switch tasks[indexPath.row].cellStatus {
            
     
            
        case "ToDo":
            cell.tappedStatusBarOutlet.backgroundColor = .systemRed
            
        case "Done":
            cell.tappedStatusBarOutlet.backgroundColor = .systemGreen
            
        case "In Progress":
            cell.tappedStatusBarOutlet.backgroundColor = .systemOrange
            
        default:
            break
        }
        
        cell.delegate = self
        return cell
    }

    func didTapStatusButton(cell: TaskTableViewCell) {
        if let chosenIndex = tableView.indexPath(for: cell) {
            var statusNow = tasks[chosenIndex.row].cellStatus
            
            switch statusNow {
            case "ToDo":
                statusNow = "Done"
                tasks[chosenIndex.row].cellStatus = statusNow
                tableView.reloadData()
                users[userIndex].task?[chosenIndex.row].cellStatus = statusNow
                UserDefaultsManager.shared.setUsers(users)
                
                
            case "Done":
                statusNow = "In progress"
                tasks[chosenIndex.row].cellStatus = statusNow
                tableView.reloadData()
                users[userIndex].task?[chosenIndex.row].cellStatus = statusNow
                UserDefaultsManager.shared.setUsers(users)
                
            case "In progress":
                statusNow = "ToDo"
                tasks[chosenIndex.row].cellStatus = statusNow
                tableView.reloadData()
                users[userIndex].task?[chosenIndex.row].cellStatus = statusNow
                UserDefaultsManager.shared.setUsers(users)
                
            default:
                break
            }
            
        }
        print("кнопка натискається")
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "detail") as! TaskDetailViewController
        vc2.userIndex = userIndex
//        vc2.update = {
//            DispatchQueue.main.async {
//                self.updateTasks()
//            }
//        }
            self.navigationController?.pushViewController(vc2, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedTask = tasks[indexPath.row]
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "detail") as! TaskDetailViewController
        vc2.userIndex = userIndex
        vc2.currentTask = selectedTask
        
//        vc2.tasks[indexPath.row].cellTitle = selectedTask.cellTitle
//        vc2.tasks[indexPath.row].cellDescription = selectedTask.cellDescription
//
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    
}
