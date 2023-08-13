//
//  ContentView.swift
//  Todo
//
//  Created by Omar Alshehhi on 14/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todos = [Todo(title:"shower the baby", iscompleted: true),Todo(title:"Feed the baby"),Todo(title:"change the babys diaper"),Todo( title:"Play with the baby"),Todo( title:"Dance with the baby")]
    
    
    
    
    
    
    var body: some View {
        NavigationStack {
                List($todos) { $todo in
                    HStack{
                        Image(systemName:
                                todo.iscompleted ? "checkmark.circle.fill" : "circle")
                        .onTapGesture {
                            todo.iscompleted.toggle()
                        }
                        
                        Text(todo.title)
                            .strikethrough(todo.iscompleted)
                    }
                    
                }
                .navigationTitle("Todos")            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
