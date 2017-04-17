//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func saludo(nombre:String, dia:String) -> String {
    
    
    func queDiaEsHoy() -> Int {
        
        let hoy = Date()

        let calendar = Calendar.current

        return calendar.component(.day, from: hoy)
    }
    
    
    return "Hola \(nombre) hoy es \(dia) día \(queDiaEsHoy())";
}

let nombre = "Ivan"

saludo(nombre: nombre, dia:"Martes")


var numerador:Double = 14.0
var divisor:Double = 3.0
var resultado:Double = numerador / divisor

var numeroInt = 10
var numeroString = "10"


var persona = (nombre: "John", apellido: "Smith")

//var nombrePersona   = persona.nombre
//var apellidoPersona = persona.apellido

var (nombrePersona, apellidoPersona) = persona

print(nombrePersona + " " + apellidoPersona)

var (soloNombre, _) = persona
var (_, soloApellido) = persona

print(soloNombre + " " + soloApellido)


// Closure sin parámetros que devuelve un String
var hola: () -> (String) = {
    return "Hola!"
}

hola() // Hello!

// Closure con un parámetro Int que devuelve otro Int
var doble: (Int) -> (Int) = {
    x in
    return 2 * x
}

doble(2) // El resultado es 4

var numeros = [1, 4, 2, 5, 8, 3]

//numeros.sort(by: <#T##(Int, Int) -> Bool#>)

var sorter: (Int, Int) -> (Bool) = {
    x,y in
    return x < y
}

numeros.sort(by: sorter)

numeros.sort(by: {
    x,y in
    return x < y
})

print(numeros)


// FIBONACCI

enum FibonacciError : Error {
    case Negativo
    case MuyLargo
}

func fibonacci(n:Int) throws -> Int {
    
    guard n >= 0
    else {
        throw FibonacciError.Negativo
    }
    
    guard n <= 10
    else {
        throw FibonacciError.MuyLargo
    }
    
    return try n > 1 ? fibonacci(n: n-1) + fibonacci(n: n-2) : n
}

do {
    try fibonacci(n: -1)
}
catch FibonacciError.Negativo {
    print("Valor negativo")
}
catch FibonacciError.MuyLargo {
    print("Valor demasiado largo")
}
catch {
    print("Ha ocurrido un error")
}

try fibonacci(n: 0)
try fibonacci(n: 1)
try fibonacci(n: 2)
try fibonacci(n: 3)
try fibonacci(n: 7)
//try fibonacci(n: 10)

var x = 0;
for var i in 0..<10 {
    x = try fibonacci(n: i)
}


