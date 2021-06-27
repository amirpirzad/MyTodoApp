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
    @State var newTodoIsPresented: Bool = false

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
        .onAppear {
            viewModel.list()
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
                newTodoIsPresented.toggle()
            }
            .fullScreenCover(isPresented: $newTodoIsPresented, content: {
                NewTodoView(viewModel: viewModel)
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
