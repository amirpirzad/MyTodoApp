//
//  TagView.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/26/21.
//

import SwiftUI

struct TagView: View {
    var color: Color
    var backColor: Color?
    var isLarge: Bool

    var body: some View {
        ZStack {
            Circle().frame(width: isLarge ? 40 : 20, height: isLarge ? 40: 20).foregroundColor(color)
            if let color = backColor {
                Circle().frame(width: isLarge ? 20 : 10, height: isLarge ? 20 : 10).foregroundColor(color)
            } else {
                Circle().frame(width: isLarge ? 20 : 10, height: isLarge ? 20 : 10).foregroundColor(Color.white)
            }
        }
    }
}


struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(color: .red, isLarge: true)
    }
}
