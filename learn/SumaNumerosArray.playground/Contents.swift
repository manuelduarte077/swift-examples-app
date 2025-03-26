// Usando un bucle for
func sumArray(_ numbers: [Int]) -> Int {
    var sum = 0
    for num in numbers {
        sum += num
    }
    return sum
}

// Prueba
let valores = [10, 20, 30, 40, 50]
print(sumArray(valores)) // Salida: 150


// Iniciamos sum en 0 -> sum = 0
// Recorremos el array y sumamos cada numero a sum
// y retorna el resultado



// Usando Reduce
// En Swift tenemos la funcion reduce(), que nos permite sumar todos los elementos de forma mas elegante

func sumArrayReduce(_ array: [Int]) -> Int {
    return array.reduce(0, +)
}

let valoresReduce = [5, 15, 25, 35]
print(sumArrayReduce(valoresReduce)) // Salida: 80

// reduce(0,+) inicia en 0 y va sumando cada elemento del array
// Es una forma mas consisa y rapida de escribir codigo


// Usando recursion
func sumArrayRecursive(_ numbers: [Int]) -> Int {
    if numbers.isEmpty { return 0 }
    
    return numbers.first! + sumArrayRecursive(Array(numbers.dropFirst()))
}

// Prueba
let values = [3, 6, 9, 12]
print(sumArrayRecursive(valores)) // Salida: 30


// Si el array esta vacio, devolvemos 0
// Tomamos el primer número y sumamos el resto de la lista llamando recursivamente a la función.
