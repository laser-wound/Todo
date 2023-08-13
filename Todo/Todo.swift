//
//  Todo.swift
//  Todo
//
//  Created by Omar Alshehhi on 14/08/2023.
//

import Foundation

struct Todo: Identifiable {
    let id = UUID()
    var title: String
    var iscompleted = false
}
