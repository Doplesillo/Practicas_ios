//
//  DetailViewController.swift
//  Food_Menu
//
//  Created by Jose Manuel Chairez Macias on 23/05/18.
//  Copyright © 2018 Jose Manuel Chairez Macias. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailprice: UILabel!
    @IBOutlet weak var detailDescripcion: UILabel!
    @IBOutlet weak var detailCategory: UILabel!
    @IBOutlet weak var detailOldPrice: UILabel!
    
    var fooditem : FoodItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailImage.image = self.fooditem.image
        self.detailName.text = self.fooditem.name
        self.detailprice.text = self.fooditem.price
        self.detailCategory.text = self.fooditem.category
        self.detailDescripcion.text = self.fooditem.descripcion
        self.detailOldPrice.text = self.fooditem.oldPrice
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Comprar(_ sender: UIButton) {
        
    }
    

}
