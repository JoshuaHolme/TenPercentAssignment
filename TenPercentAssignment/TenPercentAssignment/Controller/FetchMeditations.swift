//
//  FetchMeditations.swift
//  TenPercentAssignment
//
//  Created by Joshua Holme on 1/23/21.
//

import Foundation

class FetchMeditations: ObservableObject {
    @Published var meditations = Meditations(meditations: [])
    
    init() {
        let url = URL(string: "https://tenpercent-interview-project.s3.amazonaws.com/meditations.json")!
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let meditationsData = data {
                    let decodedData = try JSONDecoder().decode(Meditations.self, from: meditationsData)
                    DispatchQueue.main.async {
                        self.meditations = decodedData
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error \(error)")
            }
        }.resume()
    }
}
