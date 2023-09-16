//
//  User.swift
//  ToDoListNewProject
//
//  Created by Anton Nepotenko on 2023-09-14.
//

import Foundation

struct User: Codable{
    var login: String
    var password: String
    var task: [Task]?
}
