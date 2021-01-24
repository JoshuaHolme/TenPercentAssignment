//
//  MeditationCell.swift
//  TenPercentAssignment
//
//  Created by Joshua Holme on 1/23/21.
//

import SwiftUI

struct MeditationCell: View {
    let meditation: Meditation
    var body: some View {
        HStack {
            RemoteImage(url: meditation.imageURL!)
                .frame(width: 75, height: 75, alignment: .center)
                .cornerRadius(15)
            VStack(alignment: .leading, spacing: 8) {
                Text(meditation.title ?? "Meditation Title")
                    .fontWeight(.bold)
                Text(meditation.teacherName ?? "Teacher Name")
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

struct MeditationCell_Previews: PreviewProvider {
    static var previews: some View {
        MeditationCell(meditation: Meditation(uuid: UUID(), title: "Mindfulness Meditation", teacherName: "Joseph Goldstein", imageURL: "https://production.assets.changecollective.com/uploads/meditation/image/2/topicTile_begin.png", playCount: 844266))
            .previewLayout(PreviewLayout.fixed(width: 600, height: 100))
    }
}
