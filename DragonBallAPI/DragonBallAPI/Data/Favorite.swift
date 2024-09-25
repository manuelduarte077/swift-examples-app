//
//  Character.swift
//  DragonBallAPI
//
//  Created by Manuel Duarte on 25/9/24.
//

import Foundation
import SwiftData

@Model
class Favorite {
    @Attribute(.unique) var id: Int
    var name: String
    var race: String
    var ki: String
    
    init(id: Int, name: String, race: String, ki: String) {
        self.id = id
        self.name = name
        self.race = race
        self.ki = ki
    }
}
