//
//  HowManyMore.swift
//  Todo
//
//  Created by Omar Alshehhi on 16/08/2023.
//

import SwiftUI

struct HowManyMore : View {
    @ObservedObject var todoManager: TodoManager
    
     
    var body: some View {
        VStack {
                   Text("You have completed:")
                       .font(.largeTitle)
            Text("\(todoManager.numTodosDone)")
                       .font(.system(size: 140))
                       .foregroundColor(.accentColor)
                       .padding()
            Text(todoManager.numTodosDone == 1 ? "todo.": "todos.")
                       .font(.largeTitle)
            Text("You have ^[\(todoManager.numTodosNotDone) todos](inflect: true) left.")
                       .padding(.top)
                       
                               }
                           }
}
               
           
           
       

struct HowManyMore_Previews: PreviewProvider {
    static var previews: some View {
        HowManyMore(todoManager: TodoManager())
    }
}
