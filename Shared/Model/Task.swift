//
//  Task.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/26/21.
//

import UIKit

struct Task: Identifiable, Hashable {
    var id = UUID().uuidString
    var title: String?
    var state: TaskState
}