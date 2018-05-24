//
//  FoodItem.swift
//  Food_Menu
//
//  Created by Jose Manuel Chairez Macias on 23/05/18.
//  Copyright © 2018 Jose Manuel Chairez Macias. All rights reserved.
//

import Foundation
import UIKit

class FoodItem: NSObject {
    var name : String!
    var image : UIImage!
    var price : String!
    var descripcion: String!
    var category: String!
    var oldPrice: String!
    
    init(name: String, image:UIImage,price:String,descripcion:String,category:String,oldPrice:String) {
        self.name = name
        self.image = image
        self.price = price
        self.descripcion = descripcion
        self.category = category
        self.oldPrice = oldPrice
        
    }
}
