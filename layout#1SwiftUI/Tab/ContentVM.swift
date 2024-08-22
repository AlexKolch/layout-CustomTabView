//
//  ContentVM.swift
//  layout#1SwiftUI
//
//  Created by Алексей Колыченков on 21.08.2024.
//

import Foundation

class ContentVM: ObservableObject {
    @Published var selectedView = "plus"
    @Published var pages: [ContentPageModel] = [ContentPageModel(title: "+ 1", image: "plus"),
                                                ContentPageModel(title: "Filter", image: "filter"),
                                                ContentPageModel(title: "Setting", image: "gear")
    ]
}
