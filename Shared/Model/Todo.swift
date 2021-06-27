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

        var tasks: [Task] = []

        for taskObject in object.tasks {
            if let task = Task.mapToStruct(taskObject) {
                tasks.append(task)
            }
        }
 
        return Todo(id: object.id, title: object.title, tasks: tasks, tag: Tag(rawValue: object.tag ?? "red") ?? .red, time: object.time)
    }

    func mapToRealmObject() -> Object {
        let tasksObject = List<TaskObject>()

        for task in tasks ?? [] {
            if let task = task.mapToRealmObject() as? TaskObject {
                tasksObject.append(task)
            }
        }

        return TodoObject(id: id, title: title, tasks: tasksObject, tag: tag.rawValue, time: time)
    }
}
