//
//  TaskActionsView.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/26/21.
//

import SwiftUI

struct TaskActionsView: View {

    @ObservedObject var viewModel: TodoDetailViewModel

    @Environment(\.presentationMode) var presentationMode

    var task: Task

    var body: some View {
        HStack {
            todoButton
                .onTapGesture {
                    viewModel.update(state: .todo, task: task)
                }
            inProgressButton
                .onTapGesture {
                    viewModel.update(state: .inProgress, task: task)
                }
            doneButton
                .onTapGesture {
                    viewModel.update(state: .done, task: task)
                }
        }
    }

    var todoButton: some View {
        HStack {
            Spacer()
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .padding()
                    .foregroundColor(Color.red)
                Text("Todo")
                    .bold()
                    .foregroundColor(.white)
            }
            Spacer()
        }
    }

    var inProgressButton: some View {
        HStack {
            Spacer()
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .padding()
                    .foregroundColor(Color.yellow)
                Text("InProgress")
                    .bold()
                    .foregroundColor(.white)
            }
            Spacer()
        }
    }

    var doneButton: some View {
        HStack {
            Spacer()
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .padding()
                    .foregroundColor(Color.green)
                Text("Done")
                    .bold()
                    .foregroundColor(.white)
            }
            Spacer()
        }
    }
}

struct TaskActionsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskActionsView(viewModel: TodoDetailViewModel(todo: nil), task: Task(state: .done))
    }
}
