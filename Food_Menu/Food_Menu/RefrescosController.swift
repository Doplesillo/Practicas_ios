//
//  RefrescosController.swift
//  Food_Menu
//
//  Created by Jose Manuel Chairez Macias on 24/05/18.
//  Copyright © 2018 Jose Manuel Chairez Macias. All rights reserved.
//

import UIKit

class RefrescosController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var RefrescosTable: UITableView!
    
    var foodItems : [FoodItem] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = foodItems[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sodaCell", for: indexPath) as! RefrescosCell
        cell.sodaName.text = food.name
        cell.sodaImage.image = food.image
        cell.sodaPrice.text = food.price
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RefrescosTable.dataSource = self
        var food = FoodItem(name: "Pokesoda", image: #imageLiteral(resourceName: "pokesoda"), price: "$60", descripcion: "paquete con 10 Alitas bañadas en salsa especial estilo bufalo, un dip de aderezo y verduras",category:"Alitas",oldPrice: "$80")
        foodItems.append(food)
        food = FoodItem(name: "Big Cola", image: #imageLiteral(resourceName: "big"), price: "$12", descripcion: "paquete con 8 alitas bañadas en la salsa especial de la casa estilo barbecue acompañadas con un dip de aderezo y una cerveza de 355 ml",category:"Alitas",oldPrice: "$100")
        foodItems.append(food)
        food = FoodItem(name: "Soda Japonesa", image: #imageLiteral(resourceName: "japo"), price: "$100", descripcion: "Cerveza Individual de promocion a solo 15 pesos cada una, sin limite de compra", category: "Cervezas",oldPrice: "$25")
        foodItems.append(food)
        food = FoodItem(name: "Jarritos Mexicas", image: #imageLiteral(resourceName: "jarritos"), price: "$9", descripcion: "Ensalada estilo Caesar para aquellos veggies que son medio gays y no comen carne les tenemos la ensalada a muy buen precio", category: "Ensaladas",oldPrice: "$45")
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
