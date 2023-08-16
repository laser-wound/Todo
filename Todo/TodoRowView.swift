//
//  TodoRowView.swift
//  Todo
//
//  Created by Omar Alshehhi on 16/08/2023.
//

import SwiftUI

struct TodoRowView: View {
    
    @Binding var todo: Todo
    
    
    var body: some View {
        
        NavigationLink{
            TodoDetailView(todo: $todo)
            
        }label: {
            HStack{
                Image(systemName: todo.iscompleted ? "checkmark.circle.fill" : "circle")
                    .onTapGesture {
                        withAnimation{
                            todo.iscompleted.toggle()
                        }
                    }
                VStack(alignment:.leading){
                    Text(todo.title)
                        .strikethrough(todo.iscompleted)
                    if !todo.subtitle.isEmpty{
                        Text(todo.subtitle)
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .strikethrough(todo.iscompleted)
                    }
                }
                
            }
        }
        
        
        
        
    }
}

struct TodoRowView_Previews: PreviewProvider {
    static var previews: some View {
        TodoRowView(todo:.constant(Todo(title: "Testing")))
    }
}
