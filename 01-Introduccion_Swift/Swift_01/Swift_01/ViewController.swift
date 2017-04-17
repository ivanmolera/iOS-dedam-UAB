//
//  ViewController.swift
//  Swift_01
//
//  Created by IVAN MOLERA on 24/11/15.
//  Copyright © 2015 UAB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var alumno:Alumno?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let ivan = Persona(nombre: "Ivan", apellidos: "Molera", edad: 35)

        print(ivan.nombre) // El resultado es "Ivan"
        print(ivan.nombreCompleto()) // El resultado es "Ivan Molera"
        
        
        alumno = Alumno(nombre: "Ivan", apellidos: "Molera", edad: 35, asignaturas: ["Introducción"])
        
        alumno?.nuevaAsignatura(nombreAsignatura: "Android")
        alumno?.nuevaAsignatura(nombreAsignatura: "iOS")
        alumno?.nuevaAsignatura(nombreAsignatura: "Windows Phone")

        print("Nombre completo = \(alumno?.nombreCompleto())")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let alerta = UIAlertController(title: "Nombre del alumno", message: alumno?.nombreCompleto(), preferredStyle: UIAlertControllerStyle.alert)
        
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { (action) -> Void in
            print("Han pulsado Ok")
        }

        let cancel = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel) { (action) -> Void in
            print("Han pulsado Cancelar")
        }
        
        alerta.addAction(ok)
        alerta.addAction(cancel)
        
        present(alerta, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

