//
//  TaskActionsView.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/26/21.
//

import SwiftUI

struct TaskActionsView: View {

    var body: some View {
        HStack {
            todoButton
            inProgressButton
            doneButton
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
        TaskActionsView()
    }
}
