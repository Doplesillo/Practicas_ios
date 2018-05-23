//
//  HomeController.swift
//  Food_Menu
//
//  Created by Jose Manuel Chairez Macias on 22/05/18.
//  Copyright © 2018 Jose Manuel Chairez Macias. All rights reserved.
//

import UIKit

class HomeController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    var foodItems : [FoodItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Delegate and datasource
        homeTableView.dataSource = self
        homeTableView.delegate = self
        
        // Menu Items
        var food = FoodItem(name: "Buffalo Wings", image: #imageLiteral(resourceName: "wings1"))
        foodItems.append(food)
        food = FoodItem(name: "Barbecue Wings", image: #imageLiteral(resourceName: "wingsbbq"))
        foodItems.append(food)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Table
    */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foodItems.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = foodItems[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeCell
        cell.homeName.text = food.name
        cell.homeImage.image = food.image
        
        return cell
    }


}
