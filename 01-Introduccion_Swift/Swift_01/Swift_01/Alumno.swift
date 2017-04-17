//
//  Alumno.swift
//  Swift_01
//
//  Created by IVAN MOLERA on 24/11/15.
//  Copyright © 2015 UAB. All rights reserved.
//

import UIKit

class Alumno: Persona {
    
    var asignaturas : [String]
    
    init(nombre:String, apellidos:String, edad:Int, asignaturas:[String]) {
        
        self.asignaturas = asignaturas
        
        super.init(nombre: nombre, apellidos: apellidos, edad: edad)
    }
    
    func nuevaAsignatura(nombreAsignatura:String) {

        asignaturas.append(nombreAsignatura)
    }
    
    override func nombreCompleto() -> String {

        return self.apellidos + ", " + self.nombre
    }
}
