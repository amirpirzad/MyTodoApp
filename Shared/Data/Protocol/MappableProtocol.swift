//
//  MappableProtocol.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/27/21.
//

import RealmSwift
import UIKit

protocol MappableProtocol {
    associatedtype PersistenceType: Storable

    func mapToRealmObject() -> RealmSwift.Object
    static func mapToStruct(_ object: RealmSwift.Object) -> PersistenceType?
}

protocol Storable {}
