//
//  Task.swift
//  ToDoListNewProject
//
//  Created by Anton Nepotenko on 2023-09-14.
//

import Foundation

struct Task: Codable {
    var title: String
    var description: String
    var deadline: String
    var status: String
}
