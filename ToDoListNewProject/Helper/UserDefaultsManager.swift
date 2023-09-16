//
//  UserDefaultsManager.swift
//  ToDoListNewProject
//
//  Created by Anton Nepotenko on 2023-09-14.
//

import Foundation

class UserDefaultsManager {
    
    private let usersKey = "SavedDict"
    
    func setUsers(_ users: [User]) {
        let encoder = JSONEncoder()
        if let encodedUsers = try? encoder.encode(users) {
            UserDefaults.standard.set(encodedUsers, forKey: usersKey)
        } else {
            print("Error encoding and saving users")
        }
    }
    
    func getUsers() -> [User] {
        guard  let encodedUsers = UserDefaults.standard.data(forKey: usersKey) else {
            return []
        }
        let decoder = JSONDecoder()
        if let decodedUsers = try? decoder.decode([User].self, from: encodedUsers) {
            return decodedUsers
        } else {
            print("Error decoding users")
            return []
        }
    }
}
