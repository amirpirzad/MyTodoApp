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
        return [Todo(title: "Xitonix Project", tasks: [.init(title: "design", state: .todo), .init(title: "release", state: .done), .init(title: "v2", state: .inProgress)], tag: .red), Todo(title: "TodoApp Project", tasks: [.init(title: "release", state: .todo)], tag: .red)]
    }
}
