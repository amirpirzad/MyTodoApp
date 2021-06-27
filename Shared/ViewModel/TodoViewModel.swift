//
//  TodoViewModel.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/25/21.
//

import UIKit
import Combine

class TodoViewModel: ObservableObject {
    @Published var todoList: [Todo] = []
    var cancellable: Set<AnyCancellable> = []

    init() {
        list()
    }

    func list() {
        TodoRepository.list().sink { error in
            print(error)
        } receiveValue: { items in
            self.todoList = items
        }.store(in: &cancellable)
    }

    func add(object: Todo) {
        todoList.append(object)
        guard let object = object.mapToRealmObject() as? TodoObject else {
            return
        }
        TodoRepository.add(object: object)
    }
}
