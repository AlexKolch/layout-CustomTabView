//
//  MainModel.swift
//  layout#1SwiftUI
//
//  Created by Алексей Колыченков on 21.08.2024.
//

import Foundation

enum StatusTask: String {
    case new, skip, done
}

struct MainItem: Identifiable {
    let id = UUID()
    let leftIcon: String
    let rightIcon: String
    let generalText: String
    let timeText: String
    let status: StatusTask
    var isDone: Bool = false
}
