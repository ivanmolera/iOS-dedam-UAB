//
//  Coche.swift
//  Swift_02
//
//  Created by IVAN MOLERA on 24/11/15.
//  Copyright © 2015 UAB. All rights reserved.
//

import UIKit

class Coche: Automovil {
    let marca:String
    var color:String
    let puertas:Int
    var luces:Bool
    
    init(motor: String, marca: String, color: String, puertas: Int) {
        
        self.marca = marca
        self.color = color
        self.puertas = puertas
        self.luces = false

        super.init(motor: motor)
    }
    
    override func arrancar() {
        super.arrancar()

        luces = true
    }
}
