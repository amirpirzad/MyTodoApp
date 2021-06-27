//
//  NewTaskView.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/28/21.
//

import SwiftUI

struct NewTaskView: View {
    @ObservedObject var viewModel: TodoDetailViewModel
    
    @Environment(\.presentationMode)  var presentationMode
    
    @State var todoName: String = ""
    
    var body: some View {
        VStack {
            navigation
            Spacer()
                .frame(height: 30)
            HStack {
                TagView(color: .red, isLarge: false)
                    .padding(.leading, 30)
                TextField("To Do", text: $todoName).font(.system(size: 25, weight: .bold))
                    .padding()
                    .introspectTextField { textfield in
                        textfield.becomeFirstResponder()
                    }
            }
            Spacer()
        }
    }
    
    var navigation: some View {
        VStack {
            Spacer()
                .frame(height: 30)
            HStack {
                backButton
                Spacer()
                if todoName.count > 0 {
                    doneButton
                }
            }
        }
    }
    
    var backButton: some View {
        BackButton()
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
            .padding(.leading)
    }
    
    var doneButton: some View {
        ZStack {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(Color(UIColor.label))
            Image(systemName: "checkmark")
                .font(.system(size: 20))
                .foregroundColor(Color(UIColor.systemBackground))
        }
        .padding(.trailing)
        .onTapGesture {
            viewModel.append(task: Task(id: UUID().uuidString, title: todoName, state: .todo, time: Date()))
            presentationMode.wrappedValue.dismiss()
            NotificationCenter.default.post(.init(name: Notification.Name(rawValue: "reloadTaskView")))
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(viewModel: TodoDetailViewModel(todo: nil))
    }
}
