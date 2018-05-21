//
//  DetalleViewController.swift
//  Practica_5_Custom_cells
//
//  Created by Jose Manuel Chairez Macias on 24/04/18.
//  Copyright © 2018 Jose Manuel Chairez Macias. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController {
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var descripcion: UITextView!
    
    var img = UIImage()
    var desc = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        poster.image = img
        descripcion.text = desc
        
        
    }



}
