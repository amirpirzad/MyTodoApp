//
//  ContentView.swift
//  Shared
//
//  Created by Pirzad on 6/25/21.
//

import SwiftUI
import Combine

struct ContentView: View {

    @ObservedObject private var viewModel = TodoViewModel()

    private let columns = [
          GridItem(.flexible()),
          GridItem(.flexible()),
      ]

    @State var selectedTodo: Todo?

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 30)
            HStack{
                Spacer()
                Text("MyTodoApp")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            list
            plusButton
        }
    }

    var list: some View {
        GeometryReader { geometry in
            ScrollView() {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.todoList, id: \.self) { todo in
                        CellView(todo: todo)
                            .frame(width: geometry.size.width * 0.43, height: 100)
                            .padding(.top)
                            .padding(.bottom , 10)
                            .onTapGesture {
                                self.selectedTodo = todo
                            }
                    }
                }
                .padding()
                .fullScreenCover(item: $selectedTodo, content: { item in
                    TaskView(viewModel: TodoDetailViewModel(todo: item))
                })
            }
        }
    }

    var plusButton: some View {
        PlusButton()
            .onTapGesture {
                viewModel.add(object: .init(id: UUID().uuidString, title: UUID().uuidString, tasks: [], tag: .red))

//                self.selectedTodo = Todo(title: "", tasks: nil, tag: .red)
            }
//            .fullScreenCover(item: $selectedTodo, content: { item in
////                TaskView(viewModel: TodoDetailViewModel(todo: item))
//                viewModel.add(object: .init(id: UUID().uuidString, title: UUID().uuidString, tasks: [], tag: .red))
//            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
