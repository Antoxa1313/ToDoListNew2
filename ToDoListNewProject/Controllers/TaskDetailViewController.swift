//
//  TaskDetailViewController.swift
//  ToDoListNewProject
//
//  Created by Anton Nepotenko on 2023-09-14.
//

import UIKit

class TaskDetailViewController: UIViewController, UITextFieldDelegate {

    
    
    var currentTask = Task(
        cellTitle: "",
        cellDescription: "",
        cellDeadline: "",
        cellStatus: ""
    )
    var users = [User]()
    var userIndex = Int ()

    
    @IBOutlet weak var detailTitleTextField: UITextField!
    
    
    @IBOutlet weak var detailDescriptionTextField: UITextField!
    
//    var update: (()-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTitleTextField.delegate = self
        users = UserDefaultsManager.shared.getUsers()
    }


    
    func saveTask() {
        
        let newTask = Task(cellTitle: detailTitleTextField.text ?? "", cellDescription: detailDescriptionTextField.text ?? "", cellDeadline: "01/01/01", cellStatus: "ToDo")
        if users[userIndex].task == nil {
            users[userIndex] = User(login: users[userIndex].login, password: users[userIndex].password,task: [newTask])
        } else {
            users[userIndex].task?.append(newTask)
        }
        
        UserDefaultsManager.shared.setUsers(users)
        
        print(userIndex)
        print(users[userIndex].task )
//        guard let text = detailTitleTextField.text, !text.isEmpty else {
//           return
//        }
//
//        guard let count = UserDefaults().value(forKey: "count") as? Int else {
//            return
//        }
//        let newCount = count + 1
//        UserDefaults().set(newCount, forKey: "count")
//        UserDefaults().set(text, forKey: "task_\(newCount)")
        
//        update?()
        
        navigationController?.popViewController(animated: true)
    }
    

    @IBAction func tappedStatusButton(_ sender: UIButton) {
    }
    
    
    @IBAction func tappedSubmitButton(_ sender: UIButton) {
        
        saveTask()
            
        }
    }
    
    

