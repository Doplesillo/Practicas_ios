//
//  Utilerias.swift
//  Practica4
//
//  Created by L103-13 on 10/04/18.
//  Copyright © 2018 L103-13. All rights reserved.
//

import Foundation

class Singleton{
    static let sharedInstance: Singleton = {
        let instance = Singleton()
        
        //set up code
        
        return instance
    }()
    
    var todoListTitle = [String]()
    var todoListDesc = [String]()
    
    //Todas las variables o funciones globales necesarias para el tiempo de ejecucion
    
    func items()->Int{
        return todoListTitle.count
    }

}
