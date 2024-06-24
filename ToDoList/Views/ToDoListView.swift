//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Ryan Montoyo on 6/21/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    
    init(userId: String){
        
        // users/id/todos/entries
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos/")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button ("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)

                        }
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }

            }.sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "p6ZojU1uLzVs64LAAprbWMvwdYg2")
}
