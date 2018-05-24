//
//  CervezaController.swift
//  Food_Menu
//
//  Created by Jose Manuel Chairez Macias on 24/05/18.
//  Copyright © 2018 Jose Manuel Chairez Macias. All rights reserved.
//

import UIKit

class CervezaController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var cervezasTable: UITableView!
    
    var foodItems : [FoodItem] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = foodItems[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "beerCell", for: indexPath) as! CervezasCell
        cell.beerName.text = food.name
        cell.beerImage.image = food.image
        cell.beerPrice.text = food.price
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cervezasTable.dataSource = self
        var food = FoodItem(name: "Coronitas", image: #imageLiteral(resourceName: "corona"), price: "$25", descripcion: "paquete con 10 Alitas bañadas en salsa especial estilo bufalo, un dip de aderezo y verduras",category:"Alitas",oldPrice: "$80")
        foodItems.append(food)
        food = FoodItem(name: "Tecatitas", image:#imageLiteral(resourceName: "tecate"), price: "$10", descripcion: "paquete con 8 alitas bañadas en la salsa especial de la casa estilo barbecue acompañadas con un dip de aderezo y una cerveza de 355 ml",category:"Alitas",oldPrice: "$100")
        foodItems.append(food)
        food = FoodItem(name: "Vickys", image: #imageLiteral(resourceName: "victoria"), price: "$15", descripcion: "Cerveza Individual de promocion a solo 15 pesos cada una, sin limite de compra", category: "Cervezas",oldPrice: "$25")
        foodItems.append(food)
        food = FoodItem(name: "Minervitas", image: #imageLiteral(resourceName: "minerva"), price: "$40", descripcion: "Ensalada estilo Caesar para aquellos veggies que son medio gays y no comen carne les tenemos la ensalada a muy buen precio", category: "Ensaladas",oldPrice: "$45")
        foodItems.append(food)
        food = FoodItem(name: "Cucapa", image: #imageLiteral(resourceName: "cucapa"), price: "$120", descripcion: "Importadas desde el lejano estado de kansas city estas costillas de cerdo con la mera onda y todos te envidiaran cuando te las estes chingando bien sabroso", category: "Ribs",oldPrice: "$200")
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
