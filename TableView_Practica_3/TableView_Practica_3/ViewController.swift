//
//  ViewController.swift
//  TableView_Practica_3
//
//  Created by Jose Manuel Chairez Macias on 20/03/18.
//  Copyright © 2018 Jose Manuel Chairez Macias. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBAction func btnAdd(_ sender: UIButton) {
        //añadir nuevo dato a nuestro arreglo
        let randomN = Int(arc4random_uniform(UInt32(self.listaDeSuper.count)))
        self.listaDeSuper.insert("msg", at: randomN)
        //Llamar UITableView con la funcion beginupdate para que nos permita iniciar actualizaciones
        self.tabla.beginUpdates()
        //Llamar funcion insertRows e indicarle en que row, en que seccion y con que animacion lo debe de hacer
        self.tabla.insertRows(at: [IndexPath.init(row: randomN-1, section: 0)], with: .automatic)
        // Cerar funcion de actualizacion de UITableView
        self.tabla.endUpdates()
    }
    
    @IBAction func btnDelete(_ sender: UIButton) {
        
        self.listaDeSuper.remove(at: (tabla.indexPathForSelectedRow?.row)!)
        //Llamar UITableView con la funcion beginupdate para que nos permita iniciar actualizaciones
        self.tabla.beginUpdates()
        //Llamar funcion insertRows e indicarle en que row, en que seccion y con que animacion lo debe de hacer
        self.tabla.deleteRows(at: tabla.indexPathForRow.row, with: .automatic)
        // Cerar funcion de actualizacion de UITableView
        self.tabla.endUpdates()
    }
    
    
    @IBOutlet weak var tabla: UITableView!
    var listaDeSuper = ["Tostadas", "Tortillas", "Coca-cola","Doritos","Leche","Cereal","Cerveza","Gansito","Arizona","Frikos","Huevos","Azucar","Pañales","Cigarros","Pastas"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.dataSource = self
        tabla.delegate = self
        
    }
    
    // Implementacion de protocolos para tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDeSuper.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda")
        //modificar labek (UI general) de la celda prototipo
        celda?.textLabel?.text = listaDeSuper[indexPath.row]
        return celda!
    }
    
    
    

}

