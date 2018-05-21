//
//  ViewController.swift
//  Http_request_practica_6
//
//  Created by Jose Manuel Chairez Macias on 26/04/18.
//  Copyright © 2018 Jose Manuel Chairez Macias. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    //estructura para almacenar objetos desde el webservice
    var usuarios = [usuario]()
    
    var index = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        //WEB SERVICE
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        let task =  URLSession.shared.dataTask(with: url!) { (data, response, error) in
            //respuesta de ejecucion
            if let data = data {
                //Parsear info a Json
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                    if let json = jsonResult {
                        for item in json {
                            let id = item["id"] as! Int
                            let name = item["name"] as! String
                            let tel = item["phone"] as! String
                            let username = item["username"] as! String
                            let email = item["email"] as! String
                            let addressObj = item["address"] as! [String: Any]
                            let street = addressObj["street"]
                            let city = addressObj["city"]
                            let zipcode = addressObj["zipcode"]
                            let address = "\(street!) , \(city!) , \(zipcode!)"
                            let website = item["website"] as! String
                            let geo = addressObj["geo"] as! [String: Any]
                            let lat = Double(geo["lat"] as! String)
                            let lon = Double(geo["lng"] as! String)

                            //Construir los objetos y agregarlos al arreglo
                            self.usuarios.append(usuario(id: id, name: name, tel: tel, username: username, email: email, address: address, website: website, lat: lat!, lon: lon!))
                        }
                        self.tableView.reloadData()
                    }
                } catch let error as NSError{
                    print(error.localizedDescription)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usuarios.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  celda = tableView.dequeueReusableCell(withIdentifier: "usuario")
        celda?.textLabel?.text = usuarios[indexPath.row].name
        celda?.detailTextLabel?.text = usuarios[indexPath.row].tel
        return celda!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "detalle", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detalle"){
            let destino = segue.destination as! DetalleViewController
            destino.usuario = usuarios[index]
        }
    }
    
    
    
}

class usuario {
    //pantalla 1
    var  id = 0
    var name = ""
    var tel = ""
    //pantalla 2
    var username = ""
    var email = ""
    var address = ""
    var website = ""
    //pantalla 3
    var lat:Double = 0.0
    var lon:Double = 0.0
    
init(id:Int,name:String,tel:String,username:String,email:String,address:String,website:String,lat:Double,lon:Double) {
        self.id = id
        self.name = name
        self.tel = tel
        self.username = username
        self.email = email
        self.address = address
        self.website = website
        self.lat = lat
        self.lon = lon
    }
    
}
