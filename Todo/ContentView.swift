//
//  ContentView.swift
//  Todo
//
//  Created by Omar Alshehhi on 14/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todos = [Todo(title:"shower the baby", iscompleted: true),Todo(title:"Feed the baby"),Todo(title:"change the babys diaper"),Todo( title:"Play with the baby"),Todo( title:"Dance with the baby")]
    
    
    @State private var showAddSheet = false
    
    
    
    var body: some View {
        NavigationStack {
            List{
                ForEach($todos, editActions: [.all]) { $todo in
                    NavigationLink{
                        TodoDetailView(todo: $todo)
                    } label: {
                        
                        HStack {
                            Image(systemName:todo.iscompleted ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {todo.iscompleted.toggle() }
                            VStack(alignment: .leading) {
                                Text(todo.title)
                                    .strikethrough(todo.iscompleted)
                                if !todo.subtitle.isEmpty {
                                    Text(todo.subtitle)
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                        .strikethrough(todo.iscompleted)
                                }
                            }
                        }
                    }
                }
                .onDelete {indexSet in
                    todos.remove(atOffsets: indexSet)
                }
                .onMove{ originalOffsets, newOffset in todos.move(fromOffsets: originalOffsets, toOffset: newOffset)
                    
                }
                
            }
                    .navigationTitle("Todos")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            EditButton()
                        }
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button{
                                showAddSheet = true
                            }label:{
                                Image(systemName: "plus")
                            }
                        }
                    }
                    .sheet(isPresented: $showAddSheet){
                        NewTodoView(sourceArray: $todos)
                    }
                }
                
                
            }
        }
    

    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

