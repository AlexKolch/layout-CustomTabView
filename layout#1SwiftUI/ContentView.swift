//
//  ContentView.swift
//  layout#1SwiftUI
//
//  Created by Алексей Колыченков on 21.08.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ContentVM()
    
    var body: some View {
        TabView(selection: $vm.selectedView,
                content:  {
            Text("Tab Content 1")
                .customFont()
                .tabItem { Text("Tab Label 1") }.tag(1)
            Text("Tab Content 2").tabItem { Text("Tab Label 2") }.tag(2)
            Text("Tab Content 3").tabItem { Text("Tab Label 3") }.tag(3)
        })
        .onAppear {
            for family in UIFont.familyNames.sorted() {
                let names = UIFont.fontNames(forFamilyName: family)
                print("Family: \(family)\n Font names: \(names)")
            }
        }
    }
    
}

#Preview {
    ContentView()
}
