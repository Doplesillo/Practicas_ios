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
        var food = FoodItem(name: "Alitas Buffalo", image: #imageLiteral(resourceName: "wings1"), price: "$60", descripcion: "paquete con 10 Alitas bañadas en salsa especial estilo bufalo, un dip de aderezo y verduras",category:"Alitas",oldPrice: "$80")
        foodItems.append(food)
        food = FoodItem(name: "Alitas BBQ", image: #imageLiteral(resourceName: "wingsbbq"), price: "$70", descripcion: "paquete con 8 alitas bañadas en la salsa especial de la casa estilo barbecue acompañadas con un dip de aderezo y una cerveza de 355 ml",category:"Alitas",oldPrice: "$100")
        foodItems.append(food)
        food = FoodItem(name: "Cerveza Victoria 355ml", image: #imageLiteral(resourceName: "victoria"), price: "$15", descripcion: "Cerveza Individual de promocion a solo 15 pesos cada una, sin limite de compra", category: "Cervezas",oldPrice: "$25")
        foodItems.append(food)
        food = FoodItem(name: "Ensalada Caesar", image: #imageLiteral(resourceName: "caesar"), price: "$40", descripcion: "Ensalada estilo Caesar para aquellos veggies que son medio gays y no comen carne les tenemos la ensalada a muy buen precio", category: "Ensaladas",oldPrice: "$45")
        foodItems.append(food)
        food = FoodItem(name: "Ribs estilo Kansas", image: #imageLiteral(resourceName: "ribs"), price: "$120", descripcion: "Importadas desde el lejano estado de kansas city estas costillas de cerdo con la mera onda y todos te envidiaran cuando te las estes chingando bien sabroso", category: "Ribs",oldPrice: "$200")
        foodItems.append(food)
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
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
    //Vista Customizada del header de la tabla
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.red
        //custom Image
        let image = UIImageView(image: #imageLiteral(resourceName: "bwwlogo"))
        image.frame = CGRect(x: 5, y: 5, width: 35, height: 35)
        view.addSubview(image)
        //Custom label
        let label = UILabel()
        label.text = "Ofertas del Día"
        label.textColor = UIColor.white
        label.frame = CGRect(x: 45, y: 5, width: 200, height: 35)
        view.addSubview(label)
        
        return view
    }
    //Tamaño del header de la tabla
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    //Cargar celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = foodItems[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeCell
        cell.homeName.text = food.name
        cell.homeImage.image = food.image
        cell.homePrice.text = food.price
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            let shareDefaultText = "La promocion de \(self.foodItems[indexPath.row].name!) en Buffalo Wild Wings esta Fabulosa"
            let activityController = UIActivityViewController(activityItems: [shareDefaultText, self.foodItems[indexPath.row].image], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = UIColor.blue
        
        
        
        return [shareAction]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPromoDetail" {
            if let indexPath = self.homeTableView.indexPathForSelectedRow{
                let selectedFood = self.foodItems[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.fooditem = selectedFood
            }
        }
    }

}
