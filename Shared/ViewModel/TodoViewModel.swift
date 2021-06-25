//
//  TodoViewModel.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/25/21.
//

import UIKit
import Combine

class TodoViewModel: ObservableObject {
    func list() -> [Todo] {
        return [Todo(title: "Project deadline", caption: "adad", tag: .red), Todo(title: "test", caption: "adad", tag: .red)]
    }
}
