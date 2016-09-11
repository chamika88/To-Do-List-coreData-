//
//  ViewController.swift
//  ToDo
//
//  Created by Chamikara Dharmasena on 9/11/16.
//  Copyright © 2016 Chamikara Dharmasena. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = makeTasks()
        
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.importance {
            cell.textLabel?.text = "❗\(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        
        return cell
    }
    
    func makeTasks() -> [Task] {
        
       let task1 = Task()
       task1.name = "walk the dog"
       task1.importance = false
        
        
        let task2 = Task()
        task2.name = "buy cheese"
        task2.importance = true
        
        
        let task3 = Task()
        task3.name = "mow the lawn"
        task3.importance = false
        
        return [task1,task2,task3]
    }

    @IBAction func addBtnPressed(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "addSegue", sender: nil)
    }


}

