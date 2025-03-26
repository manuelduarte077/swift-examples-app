//
//  ContentView.swift
//  Addition of numbers
//
//  Created by Manuel Duarte on 6/2/25.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers: [Int] = [] // Lista de números
    @State private var newNumber = "" // Entrada de usuario
    
    // Función para sumar los números en el array
    var sumTotal: Int {
        numbers.reduce(0, +)
//        var sum: Int = 0
//        for number in numbers {
//            sum += number
//        }
//        return sum
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Entrada de nuevo número
                HStack {
                    TextField("Ingrese un número", text: $newNumber)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button(action: addNumber) {
                        Text("Agregar")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }

                // Lista de números ingresados
                List {
                    ForEach(numbers, id: \.self) { num in
                        Text("\(num)")
                            .font(.headline)
                    }
                }
                
                // Suma total
                Text("Suma Total: \(sumTotal)")
                    .font(.title)
                    .padding()
                
                // Botón para reiniciar la lista
                Button(action: resetList) {
                    Text("Borrar Todo")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("🧮 Suma de Números")
        }
    }
    
    // Función para agregar un número a la lista
    func addNumber() {
        if let number = Int(newNumber) {
            numbers.append(number)
            newNumber = "" // Limpiar el campo de texto
        }
    }
    
    // Función para resetear la lista
    func resetList() {
        numbers.removeAll()
    }
}

// Preview para SwiftUI
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
