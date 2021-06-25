//
//  Tag.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/25/21.
//

import UIKit

enum Tag {
    case red
}

extension Tag {
    func color() -> UIColor {
        switch self {
        case .red:
            return UIColor(red: 255 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1)
        }
    }
}
