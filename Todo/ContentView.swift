//
//  ContentView.swift
//  Todo
//
//  Created by Omar Alshehhi on 14/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todos = [Todo(title:"shower the baby"),Todo(title:"Feed the baby"),Todo(title:"change the babys diaper"),Todo( title:"Play with the baby"),Todo( title:"Dance with the baby")]
    
    
    
    
    
    
    var body: some View {
        NavigationStack {
            VStack{
                List(todos) { todo in
                    Text(todo.title)
                }
                .navigationTitle("Todos")            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
