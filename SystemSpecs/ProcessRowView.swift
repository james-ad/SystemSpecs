//
//  ProcessRowView.swift
//  SystemSpecs
//
//  Created by James Dunn on 6/7/23.
//

import SwiftUI

struct ProcessRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: "pc")
                .imageScale(.large)
                .font(.title)
            VStack(alignment: .leading, spacing: 4) {
                Text("Hello")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("World")
                    .foregroundColor(.gray)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProcessRowView()
    }
}
