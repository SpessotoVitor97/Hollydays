//
//  DestinationsModel.swift
//  Hollydays
//
//  Created by Vitor Spessoto on 20/02/22.
//

import Foundation

struct DestinationModel: Codable {
    let name: String
    let category: Category
    let city, state: String
    let id: Int
    let isFeatured: Bool
    let isFavorite: Bool
    let park: String
    let coordinates: Coordinates
    let description: String
    let imageName: String
}

enum Category: String, Codable {
    case lakes = "Lakes"
    case mountains = "Mountains"
    case rivers = "Rivers"
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let longitude, latitude: Double
}
