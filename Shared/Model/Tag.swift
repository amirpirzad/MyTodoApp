//
//  Tag.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/25/21.
//

import UIKit
import SwiftUI

enum Tag {
    case red
}

extension Tag {
    func color() -> Color {
        switch self {
        case .red:
            return Color(red: 255, green: 0, blue: 0)
        }
    }
}
