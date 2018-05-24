//
//  UserController.swift
//  Food_Menu
//
//  Created by Jose Manuel Chairez Macias on 23/05/18.
//  Copyright © 2018 Jose Manuel Chairez Macias. All rights reserved.
//

import UIKit
import UserNotifications

class UserController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var userImage: UIImageView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //Boton
    @IBAction func magic(_ sender: UIButton) {
        let alert = UIAlertController(title: "Seleccione una opcion", message: "", preferredStyle: .actionSheet)
        //Camara
        alert.addAction(UIAlertAction(title: "Tomar una foto", style: .default, handler: { (action) in
            //codigo para abrir Camara
            if(UIImagePickerController.isSourceTypeAvailable(.camera)){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            } else {
                print("No tiene Camara")
            }
        }))
        //Galeria
        alert.addAction(UIAlertAction(title: "Seleccionar de Galería", style: .default, handler: { (action) in
            if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }else{
                print("No tiene Galeria")
            }
        }))
        //Cancelar
        alert.addAction(UIAlertAction(title: "Cerrar", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    //Imagen cambiante
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.userImage.image = image
        dismiss(animated: true, completion: nil)
    }
    
    

}
