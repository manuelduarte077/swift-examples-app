// Ejercicio 1: FizzBuzz

/*
 Objetivo: Imprimir números del 1 al 100, pero con reglas especiales para múltiplos de 3 y 5.
 
 Descripción:
     Escribe un programa que imprima los números del 1 al 100 (inclusive).
     Para múltiplos de 3, imprime "Fizz" en lugar del número.
     Para múltiplos de 5, imprime "Buzz" en lugar del número.
     Para números que son múltiplos de ambos (3 y 5), imprime "FizzBuzz".
 */

import Foundation

func fizzBuzz() {
    print("--- FizzBuzz ---")
    
    for i in 1...100 {
        if i % 3 == 0 && i % 5 == 0 { // O if i % 15 == 0
            print("FizzBuzz")
        } else if i % 3 == 0 {
            print("Fizz")
        } else if i % 5 == 0 {
            print("Buzz")
        } else {
            print(i)
        }
    }
}
