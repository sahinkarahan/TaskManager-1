//
//  TaskManager_1App.swift
//  TaskManager-1
//
//  Created by Şahin Karahan on 24.12.2024.
//

import SwiftUI

@main
struct TaskManager_1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
