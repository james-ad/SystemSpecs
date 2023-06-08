//
//  ContentView.swift
//  SystemSpecs
//
//  Created by James Dunn on 6/5/23.
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
            
            PerformanceMetrics()
                .frame(height: 300)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
    }
    
    struct PerformanceMetrics: View {
        @State var isButtonTapped: Bool = false
        let backgroundColor = LinearGradient(
            colors: [
                Color(red: 0.17, green: 0.15, blue: 0.42),
                Color(red: 0.12, green: 0.1, blue: 0.25)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        let buttonColor = LinearGradient(
            colors: [
                Color(red: 0.51, green: 0.2, blue: 0.8),
                Color(red: 0.25, green: 0.15, blue: 0.75)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                ProcessRowView()
                ProcessRowView()
                ProcessRowView()
                Button() {
                    print("Inside button tapped")
                } label: {
                    Text("See Specs")
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.medium)
                }
                .frame(width: 240, height: 40)
                .padding()
                .background(buttonColor)
                .cornerRadius(20, antialiased: true)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .circular)
                )
                .shadow(color: .black, radius: 5, x: 0, y: 5)
                .animation(.easeInOut(duration: 1), value: isButtonTapped)
                .onTapGesture {
                    isButtonTapped.toggle()
                    print("hola mi boa")
                }
            }
            .padding(30)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(.black)
                    .background(backgroundColor)
                    .cornerRadius(30)
            )
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
