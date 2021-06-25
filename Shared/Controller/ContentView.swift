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
                Text("MyTodoApp").font(.largeTitle).bold()
                Spacer()
            }
            list
            plusButton
        }
    }

    var list: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                ScrollView() {
                    LazyVStack {
                        ForEach(viewModel.list(), id: \.id) { todo in
                            CellView(todo: todo).frame(width: geometry.size.width * 0.8, height: geometry.size.width / 3).padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)).onTapGesture {
                                print("ShowDetail")
                            }
                        }
                    }
                }
                Spacer()
            }
        }
    }

    var plusButton: some View {
        HStack {
            Spacer()
            ZStack {
                Circle().frame(width: 100, height: 100).padding().foregroundColor(Color.black)
                plusImage
            }.onTapGesture {
                print("AddTodo")
            }
            Spacer()
        }
    }

    var plusImage: some View {
        Image(systemName: "plus").font(.system(size: 30)).foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
