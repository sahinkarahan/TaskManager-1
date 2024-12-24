//
//  TasksView.swift
//  TaskManager-1
//
//  Created by Şahin Karahan on 24.12.2024.
//

import SwiftUI
import SwiftData

struct TasksView: View {
    
    @Binding var date: Date
    
    
    // SwiftData Dynamic Query
    @Query private var tasks: [Task]
    
    init(date: Binding<Date>) {
        self._date = date
        
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: date.wrappedValue)
        let endOfDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
        let predicate = #Predicate<Task> {
            return $0.date >= startDate && $0.date < endOfDate
        }
        
        // Sorting
        let sortDescriptor = [
            SortDescriptor(\Task.date, order: .reverse)
        ]
        self._tasks = Query(filter: predicate, sort: sortDescriptor, animation: .snappy)
        
    }
    
    var body: some View {
        
        VStack(alignment: .leading, content: {
            ForEach(tasks) { task in
                TaskItem(task: task)
                    .background(alignment: .leading) {
                        if tasks.last?.id != task.id {
                            Rectangle()
                                .frame(width: 1)
                                .offset(x: 24, y: 45)
                        }
                    }
            }
        })
        .padding(.top, 15)
        .overlay{
            if tasks.isEmpty{
                Text("No Task's Added")
                    .font(.caption)
                    .frame(width: 150)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
