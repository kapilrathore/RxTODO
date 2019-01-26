//
//  Todo.swift
//  RxSample
//
//  Created by Kapil Rathore on 09/02/18.
//  Copyright © 2018 Kapil Rathore. All rights reserved.
//

import Foundation
import RxSwift

struct Todo {
    var title: String
    var completed: Bool = false
    
    init(title: String) {
        self.title = title
    }
}

class TodoViewModel {
    
    private let disposeBag = DisposeBag()
    
    private let todoArray: Variable<[Todo]> = Variable([])
    
    public let dataSource: Observable<[Todo]>
    
    init() {
        let initTodos = [
            Todo(title: "Eat"),
            Todo(title: "Sleep"),
            Todo(title: "Eat more"),
            Todo(title: "Sleep more")
        ]
        todoArray.value.append(contentsOf: initTodos)
        dataSource = todoArray.asObservable()
    }
    
    func addTodo(title: String) {
        todoArray.value.append(Todo(title: title))
    }
    
    func removeTodo(at index: Int) {
        if index < todoArray.value.count {
            todoArray.value.remove(at: index)
        }
    }
}
