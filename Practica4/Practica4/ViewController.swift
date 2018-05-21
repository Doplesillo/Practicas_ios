//
//  ViewController.swift
//  Practica4
//
//  Created by L103-13 on 10/04/18.
//  Copyright © 2018 L103-13. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.sharedInstance.todoListTitle.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "tarea")
        celda?.textLabel?.text = Singleton.sharedInstance.todoListTitle[indexPath.row]
        celda?.detailTextLabel?.text = Singleton.sharedInstance.todoListDesc[indexPath.row]
        return celda!
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

