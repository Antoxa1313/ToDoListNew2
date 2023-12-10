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
    
    var editedTaskIndex = Int()
    
    var isNewTask = Bool()
    
    @IBOutlet weak var detailTitleTextField: UITextField!
    
    
    @IBOutlet weak var detailDescriptionTextField: UITextField!
   
    @IBOutlet weak var tappeddetailStatusBarOutlet: UIButton!
    
    
    
//    var update: (()-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        users = UserDefaultsManager.shared.getUsers()
        detailTitleTextField.delegate = self
        if isNewTask == false {
            detailTitleTextField.text = users[userIndex].task?[editedTaskIndex].cellTitle
            detailDescriptionTextField.text = users[userIndex].task?[editedTaskIndex].cellDescription
            tappeddetailStatusBarOutlet.setTitle(users[userIndex].task?[editedTaskIndex].cellStatus, for: .normal)
        } else {
            detailTitleTextField.text = ""
            detailDescriptionTextField.text = ""
            tappeddetailStatusBarOutlet.setTitle("ToDo", for: .normal)
        }
        
    }


    
    func saveTask() {
        if isNewTask {
            
            
            let newTask = Task(cellTitle: detailTitleTextField.text ?? "", cellDescription: detailDescriptionTextField.text ?? "", cellDeadline: "01/01/01", cellStatus: "ToDo")
            if users[userIndex].task == nil {
                users[userIndex] = User(login: users[userIndex].login, password: users[userIndex].password,task: [newTask])
            } else {
                users[userIndex].task?.append(newTask)
                
                //            detailTitleTextField.delegate = self
                //            detailTitleTextField.text = currentTask.cellTitle
                //            detailDescriptionTextField.text = currentTask.cellDescription
                //            tappeddetailStatusBarOutlet.setTitle(currentTask.cellStatus, for: .normal)
                //            users = UserDefaultsManager.shared.setUsers
                
            }
            
            
            UserDefaultsManager.shared.setUsers(users)
            
            print(userIndex)
            print(users[userIndex].task )
            
            
            navigationController?.popViewController(animated: true)
        } else {
            users[userIndex].task?[editedTaskIndex].cellTitle = detailTitleTextField.text ?? ""
            users[userIndex].task?[editedTaskIndex].cellDescription = detailDescriptionTextField.text ?? ""
            UserDefaultsManager.shared.setUsers(users)
            navigationController?.popViewController(animated: true)
        }
    }

//    @IBAction func tappedStatusButton(_ sender: UIButton) {
//    }
    
    
    @IBAction func tappedSubmitButton(_ sender: UIButton) {
        
        saveTask()
            
        }
    }
    
    

