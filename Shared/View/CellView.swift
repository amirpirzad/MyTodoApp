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
                    Spacer()
                    TagView(color: todo?.tag.color() ?? .clear)
                        .padding(.trailing)
                        .padding(.top)
                }
                HStack {
                    Text(todo?.title ?? "")
                        .font(.body)
                        .bold()
                        .foregroundColor(.black)
                }
                Text("\(todo?.tasks?.count ?? 0) tasks")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.gray)
                    .font(.callout)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 10, trailing: 10))
            }
        }
        .cornerRadius(12)
        .shadow(color: Color(.separator), radius: 2, x: 0, y: -1)
    }
}

struct CCellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView()
    }
}
