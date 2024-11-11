//
//  ContentView.swift
//  FlashLight
//
//  Created by Manuel Duarte on 26/10/24.
//

import SwiftUI
import AVFoundation

class FlashlightManager: ObservableObject {
    @Published var isOn: Bool = false {
        didSet {

            toggleFlashlight(isOn: isOn)

        }
    }
    
    private func toggleFlashlight(isOn: Bool) {
        guard let device = AVCaptureDevice.default(for: .video), device.hasTorch else {
            print("Flashlight is not available on this device.")
            return
        }
        
        do {
            try device.lockForConfiguration()
            device.torchMode = isOn ? .on : .off
            device.unlockForConfiguration()
        } catch {
            print("Flashlight could not be used: \(error)")
        }
    }
}

struct ContentView: View {
    @StateObject private var flashlightManager = FlashlightManager()
    
    var body: some View {
        VStack {
            Image(systemName: "lightbulb.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)
                .shadow(color: flashlightManager.isOn ? .yellow.opacity(0.7) : .clear, radius: flashlightManager.isOn ? 20 : 0)
                .overlay(
                    Circle()
                        .stroke(flashlightManager.isOn ? Color.yellow : Color.gray, lineWidth: 5)
                        .blur(radius: flashlightManager.isOn ? 10 : 0)
                        .scaleEffect(flashlightManager.isOn ? 1.2 : 1.0)
                        .opacity(flashlightManager.isOn ? 0.8 : 0)
                )
                .animation(.easeInOut(duration: 0.2), value: flashlightManager.isOn)
                .onTapGesture {
                    flashlightManager.isOn.toggle()
                }
        }
    }
}

#Preview {
    ContentView()
}
