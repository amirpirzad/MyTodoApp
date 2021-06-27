//
//  Task.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/26/21.
//

import UIKit
import RealmSwift

struct Task: Identifiable, Hashable, Storable {
    var id: String?
    var title: String?
    var state: TaskState
    var time: Date?
}

extension Task: MappableProtocol {
    func mapToRealmObject() -> Object {
        return TaskObject(id: id, title: title, state: state, time: time)
    }

    static func mapToStruct(_ object: Object) -> Task? {
        guard let object = object as? TaskObject else {
            return nil
        }

        return Task(id: object.id, title: object.title, state: TaskState(rawValue: object.state ?? "todo") ?? .todo, time: object.time)
    }

    typealias PersistenceType = Task


}
