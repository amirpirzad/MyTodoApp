//
//  TodoDetailViewModel.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/26/21.
//

import SwiftUI
import UIKit
import Combine

class TodoDetailViewModel: ObservableObject {
    var todo: Todo?

    init(todo: Todo?) {
        self.todo = todo
    }
}
