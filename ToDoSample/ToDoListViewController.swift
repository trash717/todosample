//
//  ViewController.swift
//  ToDoSample
//
//  Created by onishi on 2016/06/01.
//  Copyright © 2016年 Kronos. All rights reserved.
//

import UIKit
import CoreData

class ToDoListViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var todoEntities: [Todo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoEntities = Todo.mr_findAll() as? [Todo]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        todoEntities = Todo.mr_findAll() as? [Todo]
//        tableView.reloadData()
    }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let id = segue.identifier else {
      return
    }

    if id == "showItem" {
      if let itemvc = segue.destination as? TodoItemViewController {
        itemvc.delegate = self
      }
    }
  }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return todoEntities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoList") as! ToDoListTableViewCell
        let todo:Todo = todoEntities[indexPath.row]
        cell.title.text = todo.title
        cell.desc.text = todo.desc
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
          let todo = todoEntities.remove(at: indexPath.row)
//            let todo = todoEntities[indexPath.row]

            todo.mr_deleteEntity()
//            todoEntities = Todo.mr_findAll() as? [Todo]
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
        
    }
    
    @IBAction func backItem(_ segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func selectedMode(_ sender: UIBarButtonItem) {
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "Please select", message: "mode select", preferredStyle: .actionSheet)
        
        let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            print("Cancel")
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
        
        let saveActionButton: UIAlertAction = UIAlertAction(title: "Text", style: .default)
            { action -> Void in
                print("Save")
        }
        actionSheetControllerIOS8.addAction(saveActionButton)
        
        let deleteActionButton: UIAlertAction = UIAlertAction(title: "Image", style: .default)
            { action -> Void in
                print("Image")
        }
        actionSheetControllerIOS8.addAction(deleteActionButton)
        self.present(actionSheetControllerIOS8, animated: true, completion: nil)
    }
    
}

// DataUpdateプロトコル
protocol DataUpdateDelegate: class {
  // 更新
  // Paramter -
  //    data: 追加データ
  //
  func update(_ data:Todo )
}

// MARK: - データ更新デリゲート
extension ToDoListViewController: DataUpdateDelegate {
  func update(_ data: Todo) {
    todoEntities.append(data)
    self.tableView.reloadData()
  }
}
