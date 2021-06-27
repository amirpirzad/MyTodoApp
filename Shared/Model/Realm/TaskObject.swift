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
    @objc dynamic var state: String?
    @objc dynamic var time: Date?

    override static func primaryKey() -> String? {
        return "id"
    }

    convenience init(id: String?, title: String?, state: TaskState, time: Date?) {
        self.init()
        self.id = id
        self.title = title
        self.state = state.rawValue
        self.time = time
    }
}
