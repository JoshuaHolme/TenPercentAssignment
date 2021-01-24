//
//  SubtopicView.swift
//  TenPercentAssignment
//
//  Created by Joshua Holme on 1/23/21.
//

import SwiftUI

struct SubtopicView: View {
    @ObservedObject var fetchedMeditations = FetchMeditations()
    
    let subtopic: Topic
    
    let columns = [
        GridItem()
    ]
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(subtopic.title ?? "Topic Name")
                .font(.title)
                .fontWeight(.bold)
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(findMetitations(meditations: fetchedMeditations.meditations.meditations!), id: \.uuid) {meditation in
                    MeditationCell(meditation: meditation)
                }
            }
        }
    }
    
    func findMetitations(meditations: [Meditation]) -> [Meditation]{
        var relevantMeditations: [Meditation] = []
        for meditation in meditations {
            if subtopic.meditations!.contains(meditation.uuid!) {
                relevantMeditations.append(meditation)
            }
        }
        return relevantMeditations.sorted(by: {$0.playCount! > $1.playCount!})
    }
}

//struct SubtopicView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubtopicView()
//    }
//}
