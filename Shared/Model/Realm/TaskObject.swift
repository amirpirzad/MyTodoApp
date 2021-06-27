//
//  TaskObject.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/27/21.
//

import RealmSwift
import UIKit

class TaskObject: Object {
    @objc dynamic var id: String?
    @objc dynamic var title: String?
    dynamic var state: TaskState = .todo

    override static func primaryKey() -> String? {
        return "id"
    }

    convenience init(id: String?, title: String?, state: TaskState) {
        self.init()
        self.id = id
        self.title = title
        self.state = state
    }
}
