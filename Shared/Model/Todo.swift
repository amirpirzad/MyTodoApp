//
//  Todo.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/25/21.
//

import UIKit
import RealmSwift

struct Todo: Identifiable, Hashable, Storable {
    var id: String?
    var title: String?
    var tasks: [Task]?
    var tag: Tag
    var time: Date?
}

extension Todo: MappableProtocol {
    static func mapToStruct(_ object: Object) -> Todo? {
        guard let object = object as? TodoObject else {
            return nil
        }
 
        return Todo(id: object.id, title: object.title, tasks: object.tasks, tag: Tag(rawValue: object.tag ?? "red") ?? .red, time: object.time)
    }

    func mapToRealmObject() -> Object {
        return TodoObject(id: id, title: title, tasks: tasks, tag: tag.rawValue, time: time)
    }
}
