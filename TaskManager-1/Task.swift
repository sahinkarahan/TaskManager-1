//
//  Task.swift
//  TaskManager-1
//
//  Created by Şahin Karahan on 24.12.2024.
//

import SwiftUI
import SwiftData

@Model
class Task: Identifiable{
    var id: UUID
    var title: String
    var caption: String
    var date: Date
    var isCompleted: Bool
    var tint: String
    
    init(id: UUID = .init(), title: String, caption: String, date: Date = .init(), isCompleted: Bool = false, tint: String) {
        self.id = id
        self.title = title
        self.caption = caption
        self.date = date
        self.isCompleted = isCompleted
        self.tint = tint
    }
    
    var tintColor: Color {
        switch tint {
        case "taskColor 1": return .taskColor1
        case "taskColor 2": return .taskColor2
        case "taskColor 3": return .taskColor3
        case "taskColor 4": return .taskColor4
        case "taskColor 5": return .taskColor5
        case "taskColor 6": return .taskColor6
        case "taskColor 7": return .taskColor7
        default: return .black
        
        }
    }
    
}

// var sampleTask: [Task] = [
//     .init(title: "Standup", caption: "Every day meeting", date: Date.now, tint: .yellow),
//     .init(title: "Kickoff", caption: "Travel App", date: Date.now, tint: .gray),
//     .init(title: "UI Design", caption: "Fintech App", date: Date.now, tint: .green),
//     .init(title: "Logo Design", caption: "Fintech App", date: Date.now, tint: .purple)
// ]

// Date Extension
extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
