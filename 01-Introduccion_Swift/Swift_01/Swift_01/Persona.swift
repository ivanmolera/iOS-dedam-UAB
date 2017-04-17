//
//  Persona.swift
//  Swift_01
//
//  Created by IVAN MOLERA on 24/11/15.
//  Copyright © 2015 UAB. All rights reserved.
//

import UIKit

class Persona: NSObject {

    var nombre: String
    var apellidos: String
    var edad: Int
        
    init (nombre:String, apellidos:String, edad:Int) {
        self.nombre = nombre
        self.apellidos = apellidos
        self.edad = edad
    }
    
    func nombreCompleto() -> String {

        return nombre + " " + apellidos
    }
}
