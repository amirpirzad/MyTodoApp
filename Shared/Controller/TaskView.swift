//
//  TaskView.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/26/21.
//

import SwiftUI

struct TaskView: View {

    @ObservedObject var viewModel: TodoDetailViewModel

    let reloadDataPublisher = NotificationCenter.default
        .publisher(for: .init("reloadTaskView"), object: nil)
    let dismissTaskActionsViewPublisher = NotificationCenter.default
        .publisher(for: .init("dismissTaskActionsView"), object: nil)


    @Environment(\.presentationMode) var presentationMode

    @State private var titleTextField: String = ""

    @State var newTaskIsPresented: Bool = false
    @State var showTaskActionsView: Bool = false
    @State var showDeleteDialog: Bool = false
    @State var selectedTask: Task?

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 30)
            HStack{
                backButton
                Spacer()
                moreButton
            }
            headerView
            list
                .padding(.top, 5)
            if showTaskActionsView, let task = selectedTask {
                TaskActionsView(viewModel: viewModel, task: task)
                    .onTapGesture {
                        showHideTaskActionsView(value: false)
                    }
                    .onDisappear {
                        viewModel.fetchObject()
                    }
            } else {
                addButton
            }
        }
        .onTapGesture {
            showHideTaskActionsView(value: false)
        }
        .onAppear {
            print(viewModel.todo ?? "nil")
        }
        .onDisappear {
            viewModel.rename(title: titleTextField)
            NotificationCenter.default.post(.init(name: Notification.Name(rawValue: "reloadContentView")))
        }
        .onReceive(reloadDataPublisher, perform: { _ in
            viewModel.fetchObject()
        })
        .onReceive(dismissTaskActionsViewPublisher) { _ in
            showHideTaskActionsView(value: false)
        }
    }

    var headerView: some View {
        VStack {
            HStack {
                TagView(color: viewModel.todo?.tag.color() ?? .clear, isLarge: false)
                    .padding(.leading, 30)
                TextField("Title!", text: $titleTextField)
                    .font(.system(size: 25, weight: .bold, design: .default))
                    .foregroundColor(Color.init(.label))
                    .onAppear {
                        titleTextField = viewModel.todo?.title ?? ""
                    }
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
            }
            HStack {
                Spacer().frame(width: 75)
                Text("\(viewModel.todo?.tasks?.count ?? 0) tasks")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.gray)
                    .font(.callout)
            }
        }
        .frame(height: 60)
        .padding(.top, 20)
    }

    var list: some View {
        ScrollView() {
            ForEach(viewModel.todo?.tasks ?? [], id: \.self) { task in
                VStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                            .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: -1)
                        HStack {
                            VStack {
                                HStack {
                                    Text(task.title ?? "")
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                HStack {
                                    Text(task.state.rawValue)
                                        .bold()
                                        .foregroundColor(.gray)
                                        .font(.caption)
                                    Spacer()
                                }
                            }
                            Image(systemName: "ellipsis")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .onTapGesture {
                                    selectedTask = task
                                    showHideTaskActionsView(value: true)
                                }
                        }
                        .padding([.leading, .trailing])
                    }
                    .frame(height: 60)
                }
            }
        }
    }

    var addButton: some View {
        PlusButton()
            .onTapGesture {
                newTaskIsPresented.toggle()
            }
            .fullScreenCover(isPresented: $newTaskIsPresented, content: {
                NewTaskView(viewModel: viewModel)
            })
    }

    var backButton: some View {
        BackButton()
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
            .padding(.leading)
    }

    var moreButton: some View {
        MoreButton()
            .onTapGesture {
                withAnimation {
                    showDeleteDialog = true
                }
            }
            .padding(.trailing)
            .actionSheet(isPresented: $showDeleteDialog, content: {
                ActionSheet(title: Text("Delete All"), message: Text(""), buttons: [
                    .default(Text("Delete")) {
                        viewModel.removeAllTasks()
                        viewModel.fetchObject()
                    },
                    .cancel()
                ])
            })
    }

    func showHideTaskActionsView(value: Bool) {
        withAnimation {
            showTaskActionsView = value
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(viewModel: TodoDetailViewModel(todo: .init(title: "Project", tasks: [.init(title: "design", state: .done), .init(title: "design", state: .done)], tag: .red)))
    }
}
