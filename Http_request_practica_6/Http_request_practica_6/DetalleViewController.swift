//
//  DetalleViewController.swift
//  Http_request_practica_6
//
//  Created by Jose Manuel Chairez Macias on 08/05/18.
//  Copyright © 2018 Jose Manuel Chairez Macias. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController {
    @IBOutlet weak var lbID: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbUser: UILabel!
    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var lbAddress: UILabel!
    @IBOutlet weak var lbWebsite: UILabel!
    @IBOutlet weak var lbPhone: UILabel!
    
    var usuario: usuario?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lbID.text = usuario?.id.description
        lbName.text = usuario?.name
        lbUser.text = usuario?.username
        lbEmail.text = usuario?.email
        lbAddress.text = usuario?.address
        lbWebsite.text = usuario?.website
        lbPhone.text = usuario?.tel
        
    }
    @IBAction func showMap(_ sender: UIButton) {
        performSegue(withIdentifier: "mapa", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "mapa"){
            let destino = segue.destination as! MapaViewController
            destino.lat = (usuario?.lat)!
            destino.lon = (usuario?.lon)!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
