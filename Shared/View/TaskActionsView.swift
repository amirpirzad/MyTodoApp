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
            ZStack {
                Circle()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color.red)
                Text("Todo")
                    .font(.headline)
                    .bold()
                    .foregroundColor(.white)
            }
        }
        .padding(.trailing)
    }

    var inProgressButton: some View {
        HStack {
            ZStack {
                Circle()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color.yellow)
                Text("InProgress")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)
            }
        }
        .padding([.leading, .trailing])
    }

    var doneButton: some View {
        HStack {
            ZStack {
                Circle()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color.green)
                Text("Done")
                    .font(.headline)
                    .bold()
                    .foregroundColor(.white)
            }
        }
        .padding([.leading])
    }
}

struct TaskActionsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskActionsView(viewModel: TodoDetailViewModel(todo: nil), task: Task(state: .done))
    }
}
