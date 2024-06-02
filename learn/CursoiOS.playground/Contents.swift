import UIKit

var greeting = "Hello, playground" // Var palabra reservada

var name = "Manuel"
print(name)

let lastName = "Duarte"

// Se usa esto para comentar

// Tipos de variables
// Char
var symbol:Character = "e"
var symbol2: Character = "\u{2665}"
print(symbol2)

// String
var dogName:String = "EKayser"

// Int
var year:Int = 20224

// Float
var piFloat:Float = 3.14

// Double
var priceDouble:Double = 35.120012 // Para cantidades mas grandes de decimales

// Boolean Bool
var imHappy:Bool = false


// Operadores aritmeticas
var a:Int = 5
var b:Int = 10

var sumResult = a + b // Suma
var rest = a - b // resta
var mult = a * b // Multiplicacion
var divide = a / b // Division
var module = a % b // Modulo


// Operadores de asignacion
var example = 5

example += 10
example -= 10
example %= 10
example /= 10
example *= 10

// Operadores lógicos
let age = 30

let isOlder = age > 18
let isYounger = age < 18
let isEqual = age == 30
let isNotEqual = age != 30
let isOlderOrEqual = age >= 18
let isYoungerOrEqual = age <= 18

let isSunny:Bool = true
let temperature:Int = 25

let isPleasant:Bool = temperature > 25 && isSunny // AND
let goToBeach:Bool = temperature > 25 || isSunny // OR
let wearHat:Bool = !isSunny


// Conversiones
let integerNumber:Int = 34
let decimalNumber:Double = 25.65

let superNumber:Double = Double(integerNumber) + decimalNumber
let superNumber2:Int = integerNumber + Int(decimalNumber)

/**Ejercicio 1
Registro de Asistencia: Declara una variable asistencias y asígnale un número de asistencias a una clase.
Declara una variable totalClases y asígnale el número total de clases.
Calcula el porcentaje de asistencia utilizando la fórmula: Porcentaje = (Asistencias / TotalClases) * 100.
Imprime el porcentaje de asistencia. */
var asistencias:Double = 10
var totalClases:Double = 20

var porcentaje:Double = (asistencias / totalClases) * 100
print("El resultado de asistencia es \(porcentaje)")

/** Ejercicio 2
 Calculadora de IMC (Índice de Masa Corporal):
 Declara dos variables: peso (en kilogramos) y altura (en metros).
 Calcula el IMC utilizando la fórmula: IMC = peso / (altura * altura).
 Imprime el resultado.*/

let peso:Float = 88
let altura:Float = 1.88

let imc = peso / (altura * altura)
print("El calculo de su Imc es \(imc)")


/** Ejercicio 3
 Cálculo de Descuento:
 Declara dos variables: precioOriginal y porcentajeDescuento.
 Calcula el precio después del descuento utilizando la fórmula: 
 PrecioDescuento = PrecioOriginal - (PrecioOriginal * PorcentajeDescuento / 100).
 Imprime el precio original y el precio con descuento.*/

let precioOriginal:Double = 100
let porcentajeDescuento:Double = 20
let precioDescuento = precioOriginal - (precioOriginal * porcentajeDescuento / 100)
print("El precio original es de \(precioOriginal) y con el descuento del \(porcentajeDescuento)% tu producto se queda en \(precioDescuento)")



// Funciones
func showMyName() {
    print("Hello My first function")
}

func showMyCustomName(name:String, age:Int){
   print("Hola \(name), tu edad es \(age)?")
}
showMyCustomName(name: "Manuel", age: 24)

func calculate(a:Int, b:Int) {
    let result = a + b
    print("Tu suma es \(result)")
}
calculate(a: 20, b: 33)

func youFavoriteLanguaje(_ name:String) {
    print("Este es mi lenguaje favorito \(name)")
}

youFavoriteLanguaje("Kotlin")


func calculate2(a:Int, b:Int) -> Int {
    let result = a + b
    return result
}

let mySuperResult = calculate2(a: 12, b: 4)
print(mySuperResult)


// If Else
let userAge = 8

if userAge >= 18 {
    print("Eres mayor de edad")
} else {
    print("Eres menor de edad")
}


func greeting (_ hour:Int) {
    if hour < 12 {
        print("Buenos dias")
    } else if hour < 18 {
        print("Buenas tardes")
    } else {
        print("Buenas noches")
    }
}

greeting(14)

func getMonth(_ month:Int){
    if month == 1{
        print("Enero")
    }else if month == 2{
        print("Febrero")
    }else if month == 3{
        print("Marzo")
    }else if month == 4{
        print("Abril")
    }else if month == 5{
        print("Mayo")
    }else if month == 6{
        print("Junio")
    }else if month == 7{
        print("Julio")
    }else if month == 8{
        print("Agosto")
    }else if month == 9{
        print("Septiembre")
    }else if month == 10{
        print("Octubre")
    }else if month == 11{
        print("Noviembre")
    }else if month == 12{
        print("Diciembre")
    }else{
        print("Número invalido, añade otro")
    }
}

getMonth(11)

// SWITCH
func getMonthWithSwitch(_ month:Int){
    switch month{
    case 1: print("Enero")
    case 2: print("Febrero")
    case 3: print("Marzo")
    case 4: print("Abril")
    case 5: print("Mayo")
    case 6: print("Junio")
    case 7: print("Julio")
    case 8: print("Agosto")
    case 9: print("Septiembre")
    case 10: print("Octubre")
    case 11: print("Noviembre")
    case 12: print("Diciembre")
    default: print("Introduce un mes válido")
    }
}

getMonthWithSwitch(3)
