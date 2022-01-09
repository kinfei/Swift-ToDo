//
//  TaskViewController.swift
//  ToDoApp
//
//  Created by Kin Fei Lee on 09/01/2022.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var task: String?
    
    var currentPosition: Int = 0

    var delete: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    

    @objc func deleteTask(){                
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
        
        let newCount = count - 1

        UserDefaults().setValue(newCount, forKey: "count")
        UserDefaults().setValue(nil, forKey: "task_\(currentPosition)")
        
        delete?()
        
        navigationController?.popViewController(animated: true)
    }

}
