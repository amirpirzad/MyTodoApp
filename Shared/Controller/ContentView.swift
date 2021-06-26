//
//  ContentView.swift
//  Shared
//
//  Created by Pirzad on 6/25/21.
//

import SwiftUI
import Combine

struct ContentView: View {

    private var viewModel = TodoViewModel()

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
                    ForEach(viewModel.list(), id: \.self) { todo in
                        CellView(todo: todo)
                            .padding(.top)
                            .frame(width: geometry.size.width * 0.43, height: 100)
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
                self.selectedTodo = Todo(title: "", tasks: nil, tag: .red)
            }
            .fullScreenCover(item: $selectedTodo, content: { item in
                TaskView(viewModel: TodoDetailViewModel(todo: item))
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
