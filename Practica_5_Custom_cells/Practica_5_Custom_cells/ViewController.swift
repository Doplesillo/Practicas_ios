//
//  ViewController.swift
//  Practica_5_Custom_cells
//
//  Created by Jose Manuel Chairez Macias on 19/04/18.
//  Copyright © 2018 Jose Manuel Chairez Macias. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var selectedIndex = 0
    var titles = [
        "Warcraft",
        "Space Jam",
        "Coco",
        "Ready Player One",
        "Pacific Rim",
        "Deadpool",
        "The Three Caballeros"
    ]
    
    var sinopsis = [
        "As an Orc horde invades the planet Azeroth using a magic portal, a few human heroes and dissenting Orcs must attempt to stop the true evil behind this war.",
        "In a desperate attempt to win a basketball match and earn their freedom, the Looney Tunes seek the aid of retired basketball champion, Michael Jordan.",
        "Aspiring musician Miguel, confronted with his family's ancestral ban on music, enters the Land of the Dead to find his great-great-grandfather, a legendary singer.",
        "When the creator of a virtual reality world called the OASIS dies, he releases a video in which he challenges all OASIS users to find his Easter Egg, which will give the finder his fortune.",
        "As a war between humankind and monstrous sea creatures wages on, a former pilot and a trainee are paired up to drive a seemingly obsolete special weapon in a desperate effort to save the world from the apocalypse.",
        "A fast-talking mercenary with a morbid sense of humor is subjected to a rogue experiment that leaves him with accelerated healing powers and a quest for revenge.",
        "Donald receives his birthday gifts, which include traditional gifts and information about Brazil (hosted by Zé Carioca) and Mexico (by Panchito, a Mexican Charro Rooster)."]
    
    var duraciones = [
        "2h 3min ",
        "1h 28min",
        "1h 45min",
        "2h 20min",
        "2h 11min",
        "1h 48min",
        "1h 11min"
    ]
    var generos=[
        "Action, Adventure, Fantasy",
        "Animation, Adventure, Comedy",
        "Animation, Adventure, Comedy",
        "Action, Adventure, Sci-Fi",
        "Action, Adventure, Sci-Fi",
        "Action, Adventure, Comedy ",
        "Animation, Comedy, Family"
    ]
    
    var imagenes = [
        UIImage(named: "Warcraft"),
        UIImage(named: "SpaceJam"),
        UIImage(named: "Coco"),
        UIImage(named: "ReadyPlayerOne"),
        UIImage(named: "PacificRim"),
        UIImage(named: "Deadpool"),
        UIImage(named: "TheThreeCaballeros")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Crear Celda
        let celda = tableView.dequeueReusableCell(withIdentifier: "movie") as! MovieTableViewCell
        //Modificar Componentes
        celda.movie_title.text = titles[indexPath.row]
        celda.movie_genre.text = generos[indexPath.row]
        celda.movie_sinopsis.text = sinopsis[indexPath.row]
        celda.movie_time.text = duraciones[indexPath.row]
        celda.movie_image.image = imagenes[indexPath.row]
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "detalle", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detalle"){
            //codigo
            let destination = segue.destination as! DetalleViewController
            destination.desc = sinopsis[selectedIndex]
            destination.img = imagenes[selectedIndex]!
        }
    }
    
}

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movie_image: UIImageView!
    @IBOutlet weak var movie_title: UILabel!
    @IBOutlet weak var movie_sinopsis: UITextView!
    @IBOutlet weak var movie_time: UILabel!
    @IBOutlet weak var movie_genre: UILabel!
    
    
    
}

