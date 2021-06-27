//
//  TodoRepository.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/27/21.
//

import UIKit
import RealmSwift
import Combine

class TodoRepository {
    static var dbManager: DataManager =  RealmDataManager(RealmProvider.default)

    class func list() -> AnyPublisher<[Todo], RealmError> {
        dbManager.fetch(TodoObject.self, predicate: nil, sorted: Sorted(key: "time", ascending: false)).map({
            var list: [Todo] = []
            for todo in $0 {
                if let todoObject = Todo.mapToStruct(todo) {
                    list.append(todoObject)
                }
            }
            return list
        }).eraseToAnyPublisher()
    }

    class func get(todo: Todo) -> AnyPublisher<Todo?, RealmError> {
        return dbManager.fetch(TodoObject.self, predicate: .init(format: "id == %@", todo.id ?? ""), sorted: Sorted(key: "time", ascending: false)).map({
            if let object = $0.first {
                return Todo.mapToStruct(object)
            } else {
                return nil
            }
        }).eraseToAnyPublisher()
    }

    class func add(object: TodoObject) {
        do {
            try dbManager.create(object: object)
        } catch {
            print(error)
        }
    }

    class func add(object: TaskObject) {
        do {
            try dbManager.create(object: object)
        } catch {
            print(error)
        }
    }

    class func update(object: TodoObject) {
        do {
            try dbManager.update(object: object)
        } catch {
            print(error, #function)
        }
    }
}
