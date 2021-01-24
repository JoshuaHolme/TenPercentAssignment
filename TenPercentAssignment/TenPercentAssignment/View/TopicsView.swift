//
//  ContentView.swift
//  TenPercentAssignment
//
//  Created by Joshua Holme on 1/23/21.
//

import SwiftUI

struct TopicsView: View {
    
    @ObservedObject var fetchedTopics = FetchTopics()
    
    var body: some View {
        List {
            ForEach(sortTopics(unsortedTopics: fetchedTopics.topics), id: \.uuid) {topic in
                TopicCell(topic: topic)
            }
        }
    }
    
    private func sortTopics(unsortedTopics: Topics) -> [Topic] {
        var relevantTopics: [Topic] = []
        var debugInt = 0
        
        for topic in unsortedTopics.topics! {
            if topic.parentUUID != nil {
                print("WE FOUND A CHILD INT \(debugInt)")
            }
            if topic.featured == true || topic.parentUUID == nil {
                relevantTopics.append(topic)
                print("\(topic.uuid) INT \(debugInt)")
                print("\(topic.parentUUID) \(debugInt)")
            }
            print("\n\n")
            debugInt+=1
        }
        
        return relevantTopics.sorted(by: {$0.position! < $1.position!})
    }
}

//struct TopicsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopicsView()
//    }
//}
