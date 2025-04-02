//
//  CanvasViewRepresentable.swift
//  PencilKitApp
//
//  Created by Manuel Duarte on 2/4/25.
//

import SwiftUI
import PencilKit

struct CanvasViewRepresentable: UIViewRepresentable {

    // Binding para saber si la vista ha aparecido en SwiftUI
    @Binding var hasAppeared: Bool
    // (Opcional) Binding para pasar el propio dibujo si lo gestionas con @State
    // @Binding var drawing: PKDrawing

    func makeUIView(context: Context) -> PKCanvasView {
        let canvasView = PKCanvasView()
        canvasView.drawingPolicy = .anyInput
        // canvasView.drawing = drawing // Cargar dibujo inicial si usas el binding

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            print("Error: No se pudo obtener la ventana para PKToolPicker.")
            // Añade un breakpoint aquí o más logs si sospechas que este es el problema
            return canvasView
        }
        print("Ventana obtenida, configurando ToolPicker...") // Log para confirmar

        if let toolPicker = PKToolPicker.shared(for: window) {
            toolPicker.setVisible(true, forFirstResponder: canvasView)
            toolPicker.addObserver(canvasView)
            print("ToolPicker configurado y observador añadido.") // Log para confirmar
        } else {
            print("Error: No se pudo obtener PKToolPicker.shared.") // Log
        }

        // NO llamamos a becomeFirstResponder aquí
        // canvasView.becomeFirstResponder() <--- ELIMINAR ESTA LÍNEA DE AQUÍ

        // Configura el delegado si lo necesitas
        canvasView.delegate = context.coordinator // Asegúrate de tener el Coordinator si usas esto

        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        // Si la vista de SwiftUI ha aparecido Y la PKCanvasView aún no es first responder,
        // intentamos que lo sea ahora.
        if hasAppeared && !uiView.isFirstResponder {
            print("Intentando hacer becomeFirstResponder desde updateUIView...") // Log
            // Pequeña demora para asegurar que todo está listo (a veces necesario)
            DispatchQueue.main.async {
                 if uiView.window != nil { // Comprueba si ya está en una ventana
                    let becameFirstResponder = uiView.becomeFirstResponder()
                    print("Resultado de becomeFirstResponder: \(becameFirstResponder)") // Log
                 } else {
                    print("Aún no está en la ventana, se reintentará en la próxima actualización.")
                 }
            }
        }

        // Actualizar el dibujo si cambia desde fuera (si usas el binding)
        // if uiView.drawing != drawing {
        //      uiView.drawing = drawing
        // }
    }

    func dismantleUIView(_ uiView: PKCanvasView, coordinator: Coordinator) {
        // Limpieza (igual que antes)
         guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first else {
             print("Error: No se pudo obtener la ventana para ocultar PKToolPicker en dismantle.")
             return
         }
        if let toolPicker = PKToolPicker.shared(for: window) {
            toolPicker.setVisible(false, forFirstResponder: uiView)
            toolPicker.removeObserver(uiView)
            print("CanvasView dismantled, ToolPicker limpiado.") // Log
        }
        // Opcional: uiView.resignFirstResponder()
    }

    // --- Coordinator (Necesario si usas el delegado) ---
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PKCanvasViewDelegate {
        var parent: CanvasViewRepresentable

        init(_ parent: CanvasViewRepresentable) {
            self.parent = parent
        }

        // Ejemplo: Sincronizar cambios del dibujo hacia afuera si usas el binding
        // func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        //      if parent.drawing != canvasView.drawing {
        //          parent.drawing = canvasView.drawing
        //      }
        // }
    }
}


#Preview {
    ContentView()
}
