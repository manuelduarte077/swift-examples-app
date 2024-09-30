//
//  LandmarksAppApp.swift
//  LandmarksApp
//
//  Created by Manuel Duarte on 28/9/24.
//

import SwiftUI

@main
struct LandmarksAppApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
