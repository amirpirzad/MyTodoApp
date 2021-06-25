//
//  CellView.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/25/21.
//

import SwiftUI

struct CellView: View {

    var todo: Todo?

    var body: some View {
        ZStack {
            Color.white
            VStack {
                HStack {
                    Text(todo?.title ?? "").font(.body).bold().padding(.leading).padding(.top)
                    Spacer()
                    tagView.padding()
                }
                Text(todo?.caption ?? "").frame(maxWidth: .infinity, alignment: .leading).foregroundColor(.gray).font(.callout).padding(.leading).padding(.top).padding(.trailing)
            }
        }.cornerRadius(20).shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 0)
    }

    var tagView: some View {
        ZStack {
            Circle().frame(width: 20, height: 20).foregroundColor(todo?.tag.color() ?? Color.clear)
            Circle().frame(width: 10, height: 10).foregroundColor(.white)
        }
    }
}

struct CCellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView()
    }
}
