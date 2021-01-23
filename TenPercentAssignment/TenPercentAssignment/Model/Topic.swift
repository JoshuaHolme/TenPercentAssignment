//
//  Topic.swift
//  TenPercentAssignment
//
//  Created by Joshua Holme on 1/23/21.
//

import Foundation

struct Topic: Codable {
    let uuid: UUID?
    let title: String?
    let position: Int?
    let parentUUID: UUID?
    let meditations: [UUID]?
    let featured: Bool?
    let color: String?
    let description: String?

    private enum CodingKeys: String, CodingKey {
        case uuid
        case title
        case position
        case parentUUID = "parent_uuid"
        case meditations
        case featured
        case color
        case description
    }
}
