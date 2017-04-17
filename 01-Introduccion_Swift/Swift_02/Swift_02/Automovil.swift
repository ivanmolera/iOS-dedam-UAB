//
//  Automovil.swift
//  Swift_02
//
//  Created by IVAN MOLERA on 24/11/15.
//  Copyright © 2015 UAB. All rights reserved.
//

import UIKit

class Automovil: NSObject {

    let motor:String
    var encendido:Bool
    var velocidad:Double

    init(motor:String) {
        self.motor = motor
        self.encendido = false
        self.velocidad = 0
    }
    
    func arrancar() {
        encendido = true
        SoundManager.shared().playSound("arrancar.wav")
        
        SoundManager.shared().musicVolume = 0.1
        SoundManager.shared().playMusic("idle.mp3", looping: true, fadeIn: true)
    }

    func apagar() {
        encendido = false
        SoundManager.shared().playSound("apagar.wav", looping: false, fadeIn: true)
        SoundManager.shared().stopMusic()
    }
    
    func acelerar() {
        if encendido {
            
            if velocidad == 0 {
                SoundManager.shared().playSound("acelerar01.wav")
            }
            else {
                SoundManager.shared().playSound("acelerar02.wav")
            }
            
            if motor == "Diesel" {
                velocidad += 8.5
            }
            else if motor == "Gasolina" {
                velocidad += 9.5
            }

            SoundManager.shared().musicVolume = 1
            SoundManager.shared().playMusic("driving.mp3", looping: true, fadeIn: true)
        }
    }
    
    func frenar() {
        if encendido {
            if velocidad > 0 {
                SoundManager.shared().playSound("frenar.wav")
            }

            velocidad -= 10.0

            if velocidad < 0 {
                velocidad = 0
            
                SoundManager.shared().musicVolume = 0.1
                SoundManager.shared().playMusic("idle.mp3", looping: true, fadeIn: true)
            }
        }
    }
}
