//
//  Task.swift
//  ToDoListNewProject
//
//  Created by Anton Nepotenko on 2023-09-14.
//

import Foundation

struct Task: Codable {
    var cellTitle: String
    var cellDescription: String
    var cellDeadline: String
    var cellStatus: String
}
