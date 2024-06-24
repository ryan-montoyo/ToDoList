//
//  User.swift
//  ToDoList
//
//  Created by Ryan Montoyo on 6/21/24.
//

import Foundation

struct User:Codable {
    let id:String
    let name:String
    let email:String
    let joined:TimeInterval
}
