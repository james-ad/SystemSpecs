//
//  DataPoint.swift
//  SystemSpecs
//
//  Created by James Dunn on 6/5/23.
//

import SwiftUI

struct DataPoint: View {
    let category: String
    let value: String
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 8) {
                Text(category)
                    .foregroundColor(.gray)
                    .font(.callout)
                Text(value)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .multilineTextAlignment(.center)
            .padding(2)
        }
    }
}

struct DataPoint_Previews: PreviewProvider {
    static var previews: some View {
        DataPoint(category: "Hello", value: "World")
    }
}
