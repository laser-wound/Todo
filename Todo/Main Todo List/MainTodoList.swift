//
//  MainTodoList.swift
//  Todo
//
//  Created by Omar Alshehhi on 16/08/2023.
//

import SwiftUI

struct MainTodoList: View {
    @ObservedObject var todoManager: TodoManager
    @State private var showAddSheet = false
    @State private var showConfirmAlert = false
    var body: some View {
        NavigationStack {
            List($todoManager.todos, editActions: [.all]) { $todo in
                
                TodoRowView(todo: $todo)
                
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                
                }
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    
                    Button{
                        showConfirmAlert = true
                    }label: {
                        Image(systemName: "clipboard")
                    }
                    
                    
                    Button{
                        showAddSheet = true
                    }label:{
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet){
                NewTodoView(sourceArray: $todoManager.todos)
            }
            .alert("Load sample data? Warning: This cannot be undone!", isPresented: $showConfirmAlert) {
                Button("Replace", role: .destructive) {
                    todoManager.loadSampleDate()
                
                }
                
                
            }
        }
    }
}

struct MainTodoList_Previews: PreviewProvider {
    static var previews: some View {
        MainTodoList(todoManager: TodoManager())
    }
}
