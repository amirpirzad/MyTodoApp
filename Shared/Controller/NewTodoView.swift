//
//  NewTodoView.swift
//  MyTodoApp (iOS)
//
//  Created by Pirzad on 6/27/21.
//

import SwiftUI
import Combine
import Introspect

struct NewTodoView: View {

    @ObservedObject var viewModel: TodoViewModel

    @Environment(\.presentationMode) var presentationMode

    @State var categoryName: String = ""
    @State var selectedTag: Tag = .red

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        VStack {
            navigation
            Spacer()
                .frame(height: 30)
            TextField("Category Name", text: $categoryName).font(.system(size: 30, weight: .bold)).multilineTextAlignment(.center)
                .introspectTextField { textField in
                    textField.becomeFirstResponder()
                }
            Spacer()
                .frame(height: 30)
            tagList
            Spacer()
        }
    }

    var navigation: some View {
        VStack {
            Spacer()
                .frame(height: 30)
            HStack {
                backButton
                Spacer()
                if categoryName.count > 0 {
                    doneButton
                }
            }
        }
    }

    var backButton: some View {
        BackButton()
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
            .padding(.leading)
    }

    var doneButton: some View {
        ZStack {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(Color(UIColor.label))
            Image(systemName: "checkmark")
                .font(.system(size: 20))
                .foregroundColor(Color(UIColor.systemBackground))
        }
        .padding(.trailing)
        .onTapGesture {
            viewModel.add(object: .init(id: UUID().uuidString, title: categoryName, tasks: [], tag: selectedTag, time: Date()))
            presentationMode.wrappedValue.dismiss()
        }
    }

    var tagList: some View {
        HStack {
            Spacer()
            LazyVGrid(columns: columns) {
                ForEach(Tag.allCases, id: \.self) { tag in
                    if tag == selectedTag {
                        TagView(color: tag.color(), backColor: tag.color(), isLarge: true)
                            .padding()
                    } else {
                        TagView(color: tag.color(), isLarge: true)
                            .padding()
                            .onTapGesture {
                                selectedTag = tag
                            }
                    }
                }
            }
            Spacer()
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(viewModel: TodoViewModel())
    }
}
