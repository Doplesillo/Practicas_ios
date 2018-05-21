//
//  MapaViewController.swift
//  Http_request_practica_6
//
//  Created by Jose Manuel Chairez Macias on 08/05/18.
//  Copyright © 2018 Jose Manuel Chairez Macias. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {
   
    @IBOutlet weak var mapa: MKMapView!
    
    var lat: Double = 0;
    var lon: Double = 0;
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(lat)
        print(lon)
        //agregar anotacion a mapa
        let anotation = MKPointAnnotation()
        anotation.title = "Encuentrame"
        anotation.subtitle = "..si puedes .."
        anotation.coordinate = CLLocationCoordinate2DMake(lat, lon)
        
        mapa.addAnnotation(anotation)
        
        //mapa.setCenter(anotation.coordinate, animated: true)
        
        let region = MKCoordinateRegion(center: anotation.coordinate, span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5))
        mapa.setRegion(region, animated: true)
        
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
