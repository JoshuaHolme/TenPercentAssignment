//
//  ContentView.swift
//  TenPercentAssignment
//
//  Created by Joshua Holme on 1/23/21.
//

import SwiftUI

struct TopicsView: View {
    
    @ObservedObject var fetchedTopics = FetchTopics()
    
    let columns = [
        GridItem()
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(sortTopics(unsortedTopics: fetchedTopics.topics), id: \.uuid) {topic in
                    NavigationLink(destination: TopicDetailView(selectedTopic: topic)) {
                        TopicCell(topic: topic)
                            .cornerRadius(5)
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray, lineWidth: 2))
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Topics")
    }
    
    private func sortTopics(unsortedTopics: Topics) -> [Topic] {
        var relevantTopics: [Topic] = []
        
        for topic in unsortedTopics.topics! {
            if topic.featured == true || topic.parentUUID == nil {
                relevantTopics.append(topic)
            }
        }
        
        return relevantTopics.sorted(by: {$0.position! < $1.position!})
    }
}

//struct TopicsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopicsView()
//    }
//}
