// Inversión con punteros (In-Place)
func reverseArray(_ arr: inout [Int]) {
    var left = 0
    var right = arr.count - 1
    
    while left < right {
        arr.swapAt(left, right) // Intercambia los valores
        left += 1
        right -= 1
    }
}

var numbers = [1, 2, 3, 4, 10]
reverseArray(&numbers)
print(numbers) // [10, 4, 3, 2, 1]


// Usando un nuevo array
func reversedArray(_ arr: [Int]) -> [Int] {
    var reversedArr: [Int] = []
    for num in arr.reversed() { // Simulamos un `reversed()` manualmente
        reversedArr.append(num)
    }
    return reversedArr
}

let numbers2 = [10, 20, 30, 40, 50]
let result = reversedArray(numbers2)
print(result) // [50, 40, 30, 20, 10]

// Recursion
func reverseArrayRecursive(_ arr: [Int]) -> [Int] {
    if arr.isEmpty { return [] }
    return [arr.last!] + reverseArrayRecursive(Array(arr.dropLast()))
}

let numbers3 = [7, 8, 9, 10]
let reversed = reverseArrayRecursive(numbers3)
print(reversed) // [10, 9, 8, 7]
