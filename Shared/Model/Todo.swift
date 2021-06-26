//
//  Todo.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/25/21.
//

import UIKit

struct Todo: Identifiable, Hashable {
    var id = UUID().uuidString
    var title: String?
    var tasks: [Task]?
    var tag: Tag
}

