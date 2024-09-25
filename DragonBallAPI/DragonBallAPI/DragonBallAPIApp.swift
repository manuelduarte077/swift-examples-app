//
//  DragonBallAPIApp.swift
//  DragonBallAPI
//
//  Created by Manuel Duarte on 24/9/24.
//

import SwiftUI

@main
struct DragonBallAPIApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environment(FavoriteViewModel())
        }
    }
}
