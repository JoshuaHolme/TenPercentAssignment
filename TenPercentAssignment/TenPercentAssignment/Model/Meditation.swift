//
//  Meditation.swift
//  TenPercentAssignment
//
//  Created by Joshua Holme on 1/23/21.
//

import Foundation

struct Meditation: Codable {
    let uuid: UUID?
    let title: String?
    let teacherName: String?
    let imageName: String?
    let imageURL: String?
    let playCount: Int?
    
    private enum CodingKeys: String, CodingKey {
        case uuid
        case title
        case teacherName = "teacher_name"
        case imageName = "image_name"
        case imageURL = "image_url"
        case playCount = "play_count"
    }
}
