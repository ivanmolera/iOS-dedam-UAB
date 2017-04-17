//
//  ViewController.swift
//  Swift_02
//
//  Created by IVAN MOLERA on 24/11/15.
//  Copyright © 2015 UAB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var coche:Coche?

    @IBOutlet var velocimetro: UILabel!

    @IBAction func onoff(_ sender: UIButton) {
        
        if(coche!.encendido) {
            coche!.apagar()
        }
        else {
            coche!.arrancar()
        }
        refreshVelocimetro()
    }

    @IBAction func acelerar(_ sender: UIButton) {
        coche!.acelerar()
        refreshVelocimetro()
    }

    @IBAction func frenar(_ sender: UIButton) {
        coche!.frenar()
        refreshVelocimetro()
    }
    
    func refreshVelocimetro() {
        velocimetro!.text = String(format:"%.1f", coche!.velocidad)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var catalogo:[String:Coche]?

        let seat = Coche.init(motor: "Diesel", marca: "Seat", color: "Gris", puertas: 5)
        let bmw  = Coche.init(motor: "Diesel", marca: "BMW", color: "Rojo", puertas: 3)
        let ford = Coche.init(motor: "Gasolina", marca: "Ford", color: "Negro", puertas: 5)
        let opel = Coche.init(motor: "Gasolina", marca: "Opel", color: "Azul", puertas: 3)

        catalogo = ["Seat":seat, "BMW":bmw, "Ford":ford, "Opel":opel]

        // Imprimo las marcas
        for coche in catalogo! {
            print(coche.key)
        }
        
        coche = Coche(motor: "Gasolina", marca: "Audi", color: "Rojo", puertas: 3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

