//
//  TodoTableViewController.swift
//  RxSample
//
//  Created by Kapil Rathore on 09/02/18.
//  Copyright © 2018 Kapil Rathore. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TodoTableViewController: UITableViewController {
    
    private let disposeBag = DisposeBag()
    var todoVM: TodoViewModel!
    
    @IBOutlet private weak var todoTextField: UITextField!
    @IBOutlet private weak var addTodoButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = nil
        todoVM = TodoViewModel()

        todoVM.dataSource.bind(to: tableView.rx.items(cellIdentifier: "todo", cellType: UITableViewCell.self)) {
            row, todo, cell in
            cell.textLabel?.text = todo.title.capitalized
        }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.todoVM.removeTodo(at: indexPath.row)
            }).disposed(by: disposeBag)
        
        todoTextField.rx.text.asObservable()
            .map({ (value) -> Bool in
                return value?.count ?? 0 > 3
            }).bind(to: addTodoButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
    @IBAction func addTodo(sender: UIButton) {
        todoVM.addTodo(title: todoTextField.text!)
        todoTextField.text = ""
        todoTextField.resignFirstResponder()
    }
}
