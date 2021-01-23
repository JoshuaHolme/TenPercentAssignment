//
//  ContentView.swift
//  TenPercentAssignment
//
//  Created by Joshua Holme on 1/23/21.
//

import SwiftUI

struct TopicsView: View {
    var body: some View {
        Button(action: {
            fetchTopics()
        }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        })
        .padding()
    }
    
    func fetchTopics() {
        guard let gitUrl = URL(string: "https://tenpercent-interview-project.s3.amazonaws.com/topics.json") else { return }
           URLSession.shared.dataTask(with: gitUrl) { (data, response, error) in
                    guard let data = data else { return }
                    do {
                        let decoder = JSONDecoder()
                        let jsondata = try decoder.decode(Topics.self, from: data)
                        let fetchedTopics = jsondata.topics
                        for i in 0 ... fetchedTopics!.count - 1 {
                            print(fetchedTopics![i])
                        }
                    } catch let error {
                        print("Error", error)
                 }
           }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TopicsView()
    }
}
