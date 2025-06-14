//
//  main.swift
//  TestChallenge
//
//  Created by Manuel Duarte on 3/4/25.
//

import Foundation

/*
 Generar una escalera con pisos
 Su base y altura es igual a n
 Se dibuja con # y espacios.
 La ultima linea no se precede por ningun espacio.

 Escribe un programa que genere una escalera de tamaño n

 Ejemplo: Escalera de tamaño 6
 */

func dibujo(size n: Int) {
 for i in 1...n {
   let space = String(repeating: " ", count: n - i)
   let escalera = String(repeating: "#", count: i)
     
   print(space + escalera)
 }
}

dibujo(size: 6)



/*
 Palindrome
     Escribe un programa que determine si una palabra es un palíndromo.
     El programa debe recibir una palabra como entrada.
     Debe devolver true si la palabra es un palíndromo y false si no lo es.
     La comparación debe ser insensible a mayúsculas y minúsculas.
 */

func esPalindrome(_ palabra: String) -> Bool {
    let palabraBien = palabra.lowercased()
    let palabraReversa = String(palabraBien.reversed())
    
    return palabraBien == palabraReversa
}

print(esPalindrome("Radar"))
print(esPalindrome("RADAR"))
print(esPalindrome("Trabajo"))
