//
//  RealmError.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/27/21.
//

import UIKit

enum RealmError: Error {
    case realmIsNilOrNotSpecificModel
    case realmFetchIsNil
    case saveObjectFail
    case createObjectFail(error: Error)
}
