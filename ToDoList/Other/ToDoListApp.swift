//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Ryan Montoyo on 6/21/24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
