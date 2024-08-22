//
//  MainVM.swift
//  layout#1SwiftUI
//
//  Created by Алексей Колыченков on 21.08.2024.
//

import Foundation

final class MainVM: ObservableObject {
    @Published var userName: String = "Tracy!"
    @Published var toDoTasks: [MainItem] = []
    
    func getItems() {
        self.toDoTasks = [
            MainItem(leftIcon: "figure.walk", rightIcon: "clock.fill", generalText: "Go for a walk", timeText: "25 min", status: .new),
            MainItem(leftIcon: "a.book.closed.fill", rightIcon: "clock.fill", generalText: "Read book", timeText: "15 min", status: .skip, isDone: true),
            MainItem(leftIcon: "bed.double.fill", rightIcon: "1.square.fill", generalText: "Read book", timeText: "1 time", status: .done, isDone: true)
        ]
    }
}
