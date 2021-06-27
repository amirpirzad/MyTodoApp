//
//  Sorted.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/27/21.
//

import UIKit
import RealmSwift

extension Object: Storable {}

public struct Sorted {
    var key: String
    var ascending: Bool = true
}
