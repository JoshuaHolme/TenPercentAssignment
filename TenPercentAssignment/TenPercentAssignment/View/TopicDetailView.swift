//
//  TopicDetailView.swift
//  TenPercentAssignment
//
//  Created by Joshua Holme on 1/23/21.
//

import SwiftUI

struct TopicDetailView: View {
    let topic: Topic
    @ObservedObject var fetchedTopics = FetchTopics()
    @ObservedObject var fetchedMeditations = FetchMeditations()
    
    var body: some View {
        VStack{
            Text("\(topic.description ?? "Description")")
            MeditationCell()
            Spacer()
        }
        .navigationTitle(topic.title ?? "Title")
    }
}

//struct TopicDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopicDetailView()
//    }
//}
