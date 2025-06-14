/*
 Objetivo: Determinar si una cadena de texto ingresada por el usuario es un palíndromo.
 Descripción:
     Pide al usuario que ingrese una palabra o frase.
     Ignora mayúsculas/minúsculas y espacios (opcional, pero común en entrevistas).
     Verifica si la cadena se lee igual de izquierda a derecha que de derecha a izquierda.
     Imprime si es un palíndromo o no.
Ejemplo:
     Input: "Anita lava la tina" -> Output: Es un palíndromo.
     Input: "Hola Mundo" -> Output: No es un palíndromo.
 */

import Foundation


func esPalindromo() {
    print("--- Ejercicio Palíndromo ---")
    print("Ingresa una palabra o frase:")

    if let input = readLine() {
        // Preprocesamiento: convertir a minúsculas y quitar espacios/puntuación (opcional)
        let cleanedInput = input.lowercased().filter { $0.isLetter || $0.isNumber } // Solo letras y números

        // Comparar la cadena limpia con su versión invertida
        let reversedInput = String(cleanedInput.reversed())

        if cleanedInput == reversedInput && !cleanedInput.isEmpty {
            print("'\(input)' -> Es un palíndromo.")
        } else {
            print("'\(input)' -> No es un palíndromo.")
        }
    } else {
        print("No se recibió entrada.")
    }
}
