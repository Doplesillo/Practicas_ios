//
//  ViewController.swift
//  Practica1
//
//  Created by Jose Manuel Chairez Macias on 06/03/18.
//  Copyright © 2018 Jose Manuel Chairez Macias. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtContra: UITextField!
    
    let usuario : String = "Manuel"
    let password : String = "123"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Tap para ocultar teclado
        let tap = UITapGestureRecognizer(target: self, action: #selector(ocultarTeclado))
        //agregar a la vista principal
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // ocultar teclado
    @objc func ocultarTeclado(){
        view.endEditing(true)
    }
    
    @IBAction func login(_ sender: UIButton) {
        if txtUsuario.text == usuario && txtContra.text == password {
            //crear alerta
            let alertController = UIAlertController(title: "Ingreso", message: "Has ingresado al sistema", preferredStyle: .actionSheet)
            //crear boton de cancelar
            let cancelAction = UIAlertAction(title: "Salir", style: .default, handler:  {action in
                 self.performSegue(withIdentifier: "login" , sender: self )
            })
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            //crear alerta
            let alertController = UIAlertController(title: "Ingreso", message: ":( fallaste al ingresar", preferredStyle: .alert)
            //crear boton de cancelar
            let cancelAction = UIAlertAction(title: "Salir", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }
    } // end UIButtonLogin Action
    
    


}

