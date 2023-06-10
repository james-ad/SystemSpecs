//
//  ProcessRowView.swift
//  SystemSpecs
//
//  Created by James Dunn on 6/7/23.
//

import SwiftUI

struct ProcessRowView: View {
    let category: String
    let readout: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: "pc")
                .imageScale(.large)
                .font(.title)
            VStack(alignment: .leading, spacing: 4) {
                Text(category)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(readout)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProcessRowView(category: "", readout: "")
    }
}
