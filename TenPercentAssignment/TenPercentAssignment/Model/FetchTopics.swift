//
//  FetchTopics.swift
//  TenPercentAssignment
//
//  Created by Joshua Holme on 1/23/21.
//

import Foundation

class FetchTopics: ObservableObject {
    @Published var topics = Topics(topics: [])
    
    init() {
        let url = URL(string: "https://tenpercent-interview-project.s3.amazonaws.com/topics.json")!
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let topicsData = data {
                    let decodedData = try JSONDecoder().decode(Topics.self, from: topicsData)
                    DispatchQueue.main.async {
                        self.topics = decodedData
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}
