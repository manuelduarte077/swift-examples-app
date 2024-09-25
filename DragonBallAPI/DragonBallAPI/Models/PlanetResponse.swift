//
//  PlanetResponse.swift
//  DragonBallAPI
//
//  Created by Manuel Duarte on 25/9/24.
//

import Foundation

struct PlanetResponse: Codable {
    let items: [Planet]
    let meta: MetaData
    let links: Links
}

struct MetaData: Codable {
    let totalItems: Int
    let itemCount: Int
    let itemsPerPage: Int
    let totalPages: Int
    let currentPage: Int
}

struct Links: Codable {
    let first: String
    let previous: String?
    let next: String?
    let last: String
}
