//
//  ContentView.swift
//  SystemSpecs
//
//  Created by James Dunn on 6/5/23.
//

import SwiftUI

struct ContentView: View {
    let backgroundColor = LinearGradient(
        colors: [
            Color(red: 0.13, green: 0.12, blue: 0.25),
            Color(red: 0.08, green: 0.08, blue: 0.25)
        ],
        startPoint: .topTrailing,
        endPoint: .bottomLeading
    )
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .imageScale(.large)
                .font(.largeTitle)
                .foregroundColor(.accentColor)
                .clipShape(Circle())
            Text("Hello, world!")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(5)
            Text("Hello, world!")
                .font(.title2)
                .foregroundColor(.gray)
            ZStack {
                Text("Software Engineer")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(15, antialiased: true)
                    .background(RoundedRectangle(cornerRadius: 15, style: .continuous))
            }
            
            HStack {
                DataPoint(category: "Specialty", value: "iOS")
                DataPoint(category: "Language", value: "Swift, Objective-C")
                DataPoint(category: "Years in Industry", value: "3")
                DataPoint(category: "GitHub", value: "@james-ad")
            }
            .padding()
            
            PerformanceMetricsView()
                .frame(height: 300)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
