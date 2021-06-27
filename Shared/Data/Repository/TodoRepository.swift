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
        dbManager.fetch(TodoObject.self, predicate: nil, sorted: nil).map({
            var list: [Todo] = []
            for todo in $0 {
                if let todoObject = Todo.mapToStruct(todo) {
                    list.append(todoObject)
                }
            }
            return list
        }).eraseToAnyPublisher()
    }

    class func add(object: TodoObject) {
        try? dbManager.create(object: object)
    }
}
