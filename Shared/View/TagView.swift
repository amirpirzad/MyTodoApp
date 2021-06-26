//
//  TagView.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/26/21.
//

import SwiftUI

struct TagView: View {
    var color: Color

    var body: some View {
        ZStack {
            Circle().frame(width: 20, height: 20).foregroundColor(color)
            Circle().frame(width: 10, height: 10).foregroundColor(Color.white)
        }
    }
}
