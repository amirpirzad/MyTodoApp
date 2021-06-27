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

    let reloadDataPublisher = NotificationCenter.default
        .publisher(for: .init("reloadContentView"), object: nil)

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
            if viewModel.todoList.count == 0 {
                emptyView
            } else {
                list
            }
            plusButton
        }
        .onAppear {
            viewModel.list()
        }
        .onReceive(reloadDataPublisher, perform: { _ in
            viewModel.list()
        })
    }

    var emptyView: some View {
        return VStack {
            Spacer()
                .frame(height: 30)
            ZStack {
                Color.white
                VStack {
                    Image(systemName: "plus")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    HStack {
                        Text("Create").bold().foregroundColor(.gray)
                    }
                }
            }
            .cornerRadius(15)
            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 0)
            Spacer()
        }
        .onTapGesture {
            newTodoIsPresented.toggle()
        }
        .fullScreenCover(isPresented: $newTodoIsPresented, content: {
            NewTodoView(viewModel: viewModel)
        })
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
