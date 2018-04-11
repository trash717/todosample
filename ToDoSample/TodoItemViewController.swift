//
//  TodoItemViewController.swift
//  ToDoSample
//
//  Created by onishi on 2016/06/01.
//  Copyright © 2016年 Kronos. All rights reserved.
//

import UIKit
import CoreData

class TodoItemViewController: UIViewController {

  weak var delegate: DataUpdateDelegate?

  @IBOutlet weak var saveBtn: UIBarButtonItem!
  @IBOutlet weak var cancelBtn: UIBarButtonItem!
  @IBOutlet weak var todotext: UITextField!
  @IBOutlet weak var descText: UITextField!


  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  @IBAction func doCancel(_ sender: UIBarButtonItem) {
    navigationController!.popViewController(animated: true)
  }

  @IBAction func doSave(_ sender: UIBarButtonItem) {
    let newTask = Todo.mr_createEntity() as Todo
    newTask.title = todotext.text
    newTask.desc = descText.text
    newTask.managedObjectContext!.mr_saveToPersistentStoreAndWait()

    // 更新呼び出し
    delegate?.update(newTask)
    navigationController!.popViewController(animated: true)
  }

}
