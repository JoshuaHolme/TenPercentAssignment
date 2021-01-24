//
//  MeditationCell.swift
//  TenPercentAssignment
//
//  Created by Joshua Holme on 1/23/21.
//

import SwiftUI

struct MeditationCell: View {
    var body: some View {
        HStack {
            RemoteImage(url: "https://production.assets.changecollective.com/uploads/meditation/background_image/2/Adj_5-60_Teal_B.jpg")
                .frame(width: 75, height: 75, alignment: .center)
                .cornerRadius(15)
            VStack(alignment: .leading) {
                Text("Top Text")
                    .fontWeight(.bold)
                Text("Bottom Text")
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

struct MeditationCell_Previews: PreviewProvider {
    static var previews: some View {
        MeditationCell()
    }
}
