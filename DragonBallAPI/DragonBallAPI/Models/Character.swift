//
//  Character.swift
//  DragonBallAPI
//
//  Created by Manuel Duarte on 24/9/24.
//

import Foundation

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let ki: String
    let maxKi: String
    let race: String
    let gender: String
    let description: String
    let image: String
    let affiliation: String
}
