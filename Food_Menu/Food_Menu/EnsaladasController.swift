//
//  EnsaladasController.swift
//  Food_Menu
//
//  Created by Jose Manuel Chairez Macias on 24/05/18.
//  Copyright © 2018 Jose Manuel Chairez Macias. All rights reserved.
//

import UIKit

class EnsaladasController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var EnsaladasTable: UITableView!
    
    var foodItems : [FoodItem] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = foodItems[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "saladCell", for: indexPath) as! EnsaladasCell
        cell.saladName.text = food.name
        cell.saladImage.image = food.image
        cell.saladPrice.text = food.price
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EnsaladasTable.dataSource = self
        var food = FoodItem(name: "Ensalada 1", image: #imageLiteral(resourceName: "salad1"), price: "$50", descripcion: "paquete con 10 Alitas bañadas en salsa especial estilo bufalo, un dip de aderezo y verduras",category:"Alitas",oldPrice: "$80")
        foodItems.append(food)
        food = FoodItem(name: "Ensalada 2", image: #imageLiteral(resourceName: "salad2"), price: "$50", descripcion: "paquete con 8 alitas bañadas en la salsa especial de la casa estilo barbecue acompañadas con un dip de aderezo y una cerveza de 355 ml",category:"Alitas",oldPrice: "$100")
        foodItems.append(food)
        food = FoodItem(name: "Ensalada 3", image: #imageLiteral(resourceName: "salad4"), price: "$50", descripcion: "Cerveza Individual de promocion a solo 15 pesos cada una, sin limite de compra", category: "Cervezas",oldPrice: "$25")
        foodItems.append(food)
        food = FoodItem(name: "Ensalada Caesar", image: #imageLiteral(resourceName: "caesar"), price: "$50", descripcion: "Ensalada estilo Caesar para aquellos veggies que son medio gays y no comen carne les tenemos la ensalada a muy buen precio", category: "Ensaladas",oldPrice: "$45")
        foodItems.append(food)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
