//
//  TopicCell.swift
//  TenPercentAssignment
//
//  Created by Joshua Holme on 1/23/21.
//

import SwiftUI

struct TopicCell: View {
    @ObservedObject var fetchedTopics = FetchTopics()
    
    let topic: Topic
    var body: some View {
        HStack {
            Rectangle()
                .frame(minWidth: 6, maxWidth: 12, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(UIColor(hex: topic.color ?? "#00000000") ?? UIColor.black))
            VStack (alignment: .leading, spacing: 8){
                Text(topic.title ?? "Featured")
                    .font(.title)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Text(meditationCount())
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 24)
            .padding(.top, 24)
            Spacer()
        }
    }
    
    func meditationCount() -> String {
        var numMeditation = topic.meditations?.count ?? 0
        
        for fetchedTopic in fetchedTopics.topics.topics! {
            if fetchedTopic.parentUUID == topic.uuid {
                numMeditation += fetchedTopic.meditations?.count ?? 0
            }
        }
        
        if numMeditation == 1 {
            return "\(numMeditation) Meditation"
        }
        else {
            return "\(numMeditation) Meditations"
        }
    }
}

struct TopicCell_Previews: PreviewProvider {
    static var previews: some View {
        TopicCell(topic: Topic(uuid: UUID(), title: "New & Noteworthy", position: 1, parentUUID: UUID(), meditations: [UUID()], featured: true, color: "#CCE5CE", description: "Keep your meditation fresh and inspired with fresh new content and editor's picks."))
    }
}
