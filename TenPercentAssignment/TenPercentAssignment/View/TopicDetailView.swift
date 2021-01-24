//
//  TopicDetailView.swift
//  TenPercentAssignment
//
//  Created by Joshua Holme on 1/23/21.
//

import SwiftUI

struct TopicDetailView: View {
    let selectedTopic: Topic
    @ObservedObject var fetchedTopics = FetchTopics()
    @ObservedObject var fetchedMeditations = FetchMeditations()
    
    var body: some View {
        ScrollView {
            VStack{
                Text("\(selectedTopic.description ?? "Description")")
                ForEach(findSubtopics(topics: fetchedTopics.topics.topics!), id: \.uuid) {subtopic in
                    SubtopicView(subtopic: subtopic)
                }
                Spacer()
            }
        }
        .navigationTitle(selectedTopic.title ?? "Title")
    }
    
    func findSubtopics(topics: [Topic]) -> [Topic] {
        var subtopics: [Topic] = []
        
        for topic in topics {
            if topic.parentUUID == selectedTopic.uuid {
                subtopics.append(topic)
            }
        }
        return subtopics
    }
}

//struct TopicDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopicDetailView()
//    }
//}
