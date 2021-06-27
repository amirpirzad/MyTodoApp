//
//  TodoObject.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/27/21.
//

import RealmSwift
import UIKit

class TodoObject: Object {
    @objc dynamic var id: String?
    @objc dynamic var title: String?
    dynamic var tasks: [Task]?
    dynamic var tag: Tag?

    override static func primaryKey() -> String? {
        return "id"
    }

    convenience init(id: String?, title: String?, tasks: [Task]?, tag: Tag?) {
        self.init()
        self.id = id
        self.title = title
        self.tasks = tasks
        self.tag = tag
    }
}
