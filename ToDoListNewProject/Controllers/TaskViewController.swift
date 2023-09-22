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
    var userIndex = Int()
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
        return cell
    }


    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       let nib = UINib(nibName: "TaskTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TaskTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        users = UserDefaultsManager.shared.getUsers() ?? [User]()
        tasks = users[userIndex].task ?? [Task]()
        
        tableView.reloadData()
    }

    @IBAction func addButtonPressed(_ sender: UIButton) {
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "detail") as! TaskDetailViewController
            self.navigationController?.pushViewController(vc2, animated: true)
        
    }
    
    
    
}
