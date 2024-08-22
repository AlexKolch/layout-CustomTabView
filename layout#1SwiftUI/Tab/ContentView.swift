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
        ZStack(alignment: .bottom) {
            HStack() {
                //TabView
                ForEach(vm.pages) { page in
                    Spacer()
                    CustonTabView(page: page, selection: $vm.selectedView)
                    Spacer()
                }
            }
            .zIndex(1)
            .padding(.vertical, 9)
            .background(Color.yellow)
            .clipShape(.capsule)
            .padding(.bottom, 1)
            .padding(.horizontal, 30)
            
            TabView(selection: $vm.selectedView,
                    content:  {
                MainView().customFont().tag("plus")
                Text("View 2").tag("filter")
                Text("View 3").tag("gear")
            })
        }
       
    }
}

#Preview {
    ContentView()
}

struct CustonTabView: View {
    
    var page: ContentPageModel
    @Binding var selection: String
    
    var body: some View {
        Button(action: {
            selection = page.image
        }, label: {
            HStack {
                if selection == page.image {
                    Image(page.image).resizable().frame(width: 19, height: 19)
                    Text(page.title).foregroundStyle(.black)
                } else {
                    Image(page.image).resizable().frame(width: 19, height: 19)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(selection == page.image ? Color.appGreen : .clear)
            .clipShape(.capsule)
            .offset(x: selection == "plus" ? -10 : 10)
        })
    }
}
