//
//  ContentView.swift
//  Trivia
//
//  Created by Nien Lam on 9/7/23.
//  Copyright © 2023 Line Break, LLC. All rights reserved.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        VStack(spacing: 40) {
            HStack(spacing: 20) {
                Image(uiImage: UIImage(named: "door.jpg")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Image(uiImage: UIImage(named: "centralPerk.jpg")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Image(uiImage: UIImage(named: "lyrics.jpg")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(height: 250)
            
            Text("Name the show")
                .font(.system(size: 44))
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
