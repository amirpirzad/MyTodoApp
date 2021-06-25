//
//  ContentView.swift
//  Shared
//
//  Created by Pirzad on 6/25/21.
//

import SwiftUI

struct ContentView: View {

    var viewModel = TodoViewModel()

    var body: some View {
        VStack {
            Spacer().frame(height: 30)
            HStack{
                Spacer()
                Text("MyTodoApp!").font(.largeTitle).bold()
                Spacer()
            }
            list
        }
    }

    var list: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                ForEach(viewModel.list(), id: \.id) { todo in
                    CellView(todo: todo).frame(width: geometry.size.width / 3, height: geometry.size.width / 3).padding()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
