//
//  ViewController.swift
//  Practica_7
//
//  Created by Jose Manuel Chairez Macias on 10/05/18.
//  Copyright © 2018 Jose Manuel Chairez Macias. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func magic(_ sender: UIButton) {
        let alert = UIAlertController(title: "Seleccione una opcion", message: "", preferredStyle: .actionSheet)
        //Cámara
        alert.addAction(UIAlertAction(title: "📷", style: .default, handler: { (action) in
            //Codigo para abrir camara
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
        alert.addAction(UIAlertAction(title: "🏞", style: .default, handler: { (action) in
            //codigo para abrir la galeria
            if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            } else {
                print("No tiene Galería")
            }
        }))
        //cancelar
        alert.addAction(UIAlertAction(title: "🙅🏻‍♂️", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.image.image = image
        dismiss(animated: true, completion: nil)
        
        print("imagen Cargada")
        
        let content = UNMutableNotificationContent()
        content.title = "Hola"
        content.body = "Se ha cargado la imagen"
        content.sound = UNNotificationSound.default()
        //Entregar notificacion enun tiempo determinado
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        //Crear peticion local
        let request = UNNotificationRequest.init(identifier: "FiveSecond", content: content, trigger: trigger)
        //Enviar notificacion al SO
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            print(error ?? "Houston")
        }
    }
    
}

