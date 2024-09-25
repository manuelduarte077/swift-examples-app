//
//  Planet.swift
//  DragonBallAPI
//
//  Created by Manuel Duarte on 25/9/24.
//

import Foundation

struct Planet: Codable, Identifiable {
    let id: Int
    let name: String
    let isDestroyed: Bool
    let description: String
    let image: String
    let deletedAt: String?
}
