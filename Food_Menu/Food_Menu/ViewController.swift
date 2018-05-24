//
//  ViewController.swift
//  Food_Menu
//
//  Created by Jose Manuel Chairez Macias on 21/05/18.
//  Copyright © 2018 Jose Manuel Chairez Macias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtContra: UITextField!
    
    let usuario : String = "Manuel"
    let password : String = "123"
    
    @IBAction func btnLogin(_ sender: UIButton) {
        if txtUsuario.text == usuario && txtContra.text == password{
            let alertController = UIAlertController(title: "Ingreso", message: "Bienvenido \(usuario)", preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Siguiente", style: .default) { (action) in
                self.performSegue(withIdentifier: "login", sender: self)
            }
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Ingreso", message: "Credenciales Incorrectas vuelve a intentarlo", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Salir", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ocultarTeclado))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func ocultarTeclado(){
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

