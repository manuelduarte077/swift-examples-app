//
//  CharacterResponse.swift
//  DragonBallAPI
//
//  Created by Manuel Duarte on 24/9/24.
//

import Foundation

struct CharacterResponse: Codable {
    let items: [Character]
    let meta: Meta
}

struct Meta: Codable {
    let totalItems: Int
    let itemCount: Int
    let itemsPerPage: Int
    let totalPages: Int
    let currentPage: Int
}
