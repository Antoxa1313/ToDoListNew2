//
//  TaskDetailViewController.swift
//  ToDoListNewProject
//
//  Created by Anton Nepotenko on 2023-09-14.
//

import UIKit

class TaskDetailViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var detailTitleTextField: UITextField!
    
    
    @IBOutlet weak var detailDescriptionTextField: UITextField!
    
    var update: (()-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTitleTextField.delegate = self
    }

    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        return true
    }
    
    func saveTask() {
        
        guard let text = detailTitleTextField.text, !text.isEmpty else {
           return
        }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        let newCount = count + 1
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")
        
        update?()
        
        navigationController?.popViewController(animated: true)
    }
    

    @IBAction func tappedStatusButton(_ sender: UIButton) {
    }
    
    
    @IBAction func tappedSubmitButton(_ sender: UIButton) {
        
        saveTask()
            
        }
    }
    
    

