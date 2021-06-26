//
//  PlusButton.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/26/21.
//

import SwiftUI

struct PlusButton: View {
    var body: some View {
        HStack {
            Spacer()
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .padding()
                    .foregroundColor(Color(UIColor.label))
                Image(systemName: "plus")
                    .font(.system(size: 30))
                    .foregroundColor(Color(UIColor.systemBackground))
            }
            Spacer()
        }
    }
}
