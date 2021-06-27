//
//  Tag.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/25/21.
//

import UIKit
import SwiftUI

enum Tag: String, CaseIterable, Hashable {
    case red, yellow, brown, orange, blue, purple
}

extension Tag {
    func color() -> Color {
        switch self {
        case .red:
            return Color(red: 255, green: 0, blue: 0)
        case .yellow:
            return .yellow
        case .brown:
            return Color(.brown)
        case .orange:
            return .orange
        case .blue:
            return .blue
        case .purple:
            return .purple
        }
    }
}
