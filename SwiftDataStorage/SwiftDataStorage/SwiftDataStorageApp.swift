//
//  SwiftDataStorageApp.swift
//  SwiftDataStorage
//
//  Created by Manuel Duarte on 24/9/24.
//

import SwiftUI

@main
struct SwiftDataStorageApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(ViewModel())
        }
    }
}
