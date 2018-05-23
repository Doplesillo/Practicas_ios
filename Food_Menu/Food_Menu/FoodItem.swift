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
    var price : Int!
    
    init(name: String, image:UIImage) {
        self.name = name
        self.image = image
        
    }
}
