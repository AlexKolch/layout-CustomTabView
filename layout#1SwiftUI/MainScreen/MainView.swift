//
//  MainView.swift
//  layout#1SwiftUI
//
//  Created by Алексей Колыченков on 21.08.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = MainVM()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 81.0) {
                //Шапка
                VStack(spacing: 41.0) {
                    Text("Hey, \(vm.userName)").customFont(size: 30).frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(.casualLife3DLampBooksAndObjectsForStudying)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 132)
                }
                
                //Нижняя часть
                VStack(spacing: 13.0) {
                    ForEach(vm.toDoTasks) { item in
                        ToDoItem(item: item)
                            .opacity(item.isDone ? 0.5 : 1.0)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 30)
            .padding(.bottom, 80) //отступ чтобы кастомный таббар не перекрывал контент!
        }
        .background(Color.mainBG)
        .onAppear {
            vm.getItems() //загрузка данных
        }
    }
}

struct ToDoItem: View {
    
    let item: MainItem
    
    var body: some View {
        HStack {
            
            HStack(alignment: .top, spacing: 12) {
                ZStack {
                    Image(systemName: item.leftIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                }
                .padding(7)
                .background(.imageBG)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack(alignment: .leading, spacing: 3) {
                    Text(item.generalText).font(.title3)
                    getTask(status: item.status)
                }
            }
            Spacer()
            HStack(spacing: 15.0) {
                Divider()
                VStack(spacing: 5.0) {
                    Image(systemName: item.rightIcon)
                    Text(item.timeText)
                }
                .frame(minWidth: 60)
            }
            
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 14)
        .background(Color.itemBG)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    @ViewBuilder
    func getTask(status: StatusTask) -> some View {
        switch status {
        case .new:
            StatusItem(statusText: status, image: "star.circle")
                .foregroundStyle(Color.pink)
        case .skip:
         StatusItem(statusText: status, image: "arrowshape.forward.circle")
                .foregroundStyle(.blue)
        case .done:
         StatusItem(statusText: status, image: "checkmark")
                .foregroundStyle(.appGreen)
        }
    }
}

struct StatusItem: View {
    let statusText: StatusTask
    let image: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .frame(width: 13, height: 13)
            Text(statusText.rawValue)
                .font(.headline)
        }
    }
}

#Preview {
    MainView()
}

