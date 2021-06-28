//
//  TodoDetailViewModel.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/26/21.
//

import SwiftUI
import UIKit
import Combine

class TodoDetailViewModel: ObservableObject {

    @Published var todo: Todo?
    var cancellable: Set<AnyCancellable> = []

    init(todo: Todo?) {
        self.todo = todo
    }

    func fetchObject() {
        if let todo = todo {
            TodoRepository.get(todo: todo).sink { error in
                print(error)
            } receiveValue: { item in
                self.todo = item
            }.store(in: &cancellable)
        }
    }

    func rename(title: String) {
        todo?.title = title

        guard let todo = todo, let object = todo.mapToRealmObject() as? TodoObject else {
            return
        }

        TodoRepository.update(object: object)
    }

    func append(task: Task) {
        todo?.tasks?.append(task)

        guard let todo = todo, let object = todo.mapToRealmObject() as? TodoObject else {
            return
        }

        TodoRepository.update(object: object)
    }

    func update(state: TaskState, task: Task) {
        if let index = todo?.tasks?.firstIndex(of: task) {
            todo?.tasks?[index].state = state
        }

        guard let todo = todo, let object = todo.mapToRealmObject() as? TodoObject else {
            return
        }

        TodoRepository.update(object: object)

        NotificationCenter.default.post(.init(name: Notification.Name(rawValue: "dismissTaskActionsView")))
    }

    func removeAllTasks() {
        todo?.tasks?.removeAll()

        guard let todo = todo, let object = todo.mapToRealmObject() as? TodoObject else {
            return
        }

        TodoRepository.update(object: object)
    }
}
