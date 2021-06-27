//
//  MoreButton.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/27/21.
//

import SwiftUI

struct MoreButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(Color(UIColor.label))
            Image(systemName: "ellipsis")
                .font(.system(size: 20))
                .foregroundColor(Color(UIColor.systemBackground))
        }
    }
}

