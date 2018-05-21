//
//  FormuViewController.swift
//  Practica4
//
//  Created by L103-13 on 10/04/18.
//  Copyright © 2018 L103-13. All rights reserved.
//

import UIKit

class FormuViewController: UIViewController {

    @IBOutlet weak var txtTitulo: UITextField!
    
    @IBOutlet weak var txtDesc: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(ocultarTeclado))
        view.addGestureRecognizer(tap)
    }
    
    @objc func ocultarTeclado(){
        view.endEditing(true)
    }

    
    
    @IBAction func Save(_ sender: UIButton) {
        if((txtTitulo.text?.isEmpty)! || (txtDesc.text?.isEmpty)!){
            let alert = UIAlertController(title: "Completa los campos...", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK",style: .default, handler: nil))
            present(alert,animated: true, completion: nil)
        } else{
            //Guardar infromacion en singleton
            let titulo = txtTitulo.text
            let desc = txtDesc.text
            Singleton.sharedInstance.todoListTitle.append(titulo!)
            Singleton.sharedInstance.todoListDesc.append(desc!)
            //Limpiar campos
            txtTitulo.text = ""
            txtDesc.text = ""
            //Alertas de elementos guardados
            let items = Singleton.sharedInstance.items()
            let alert = UIAlertController(title: "Elementos en la lista", message: items.description, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK",style: .default, handler: nil))
            present(alert,animated: true, completion: nil)
        }
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
