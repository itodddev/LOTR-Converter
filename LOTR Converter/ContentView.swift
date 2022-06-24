//
//  ContentView.swift
//  LOTR Converter
//
//  Created by Todd James on 6/24/22.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      // Background Image
      Image("background")
        .resizable()
        .edgesIgnoringSafeArea(.all)
      VStack {
        // Prancing Pony Image
        Image("prancingpony")
          .resizable()
          .scaledToFit() // retains height to width ratio
          .frame(height: 200)

        // Currency Exchange Text
        Text("Currency Exchange")
          .font(.largeTitle)
          .foregroundColor(.white)
        // Currency Conversion Section
        HStack {
          // Left Conversion Section
          VStack {
            // Currency
            HStack {
              // Image
              Image("silverpiece")
                .resizable()
                .scaledToFit()
                .frame(height: 33)
              // Text
              Text("Silver Piece")
                .font(.headline)
                .foregroundColor(.white)
            }
            // Text Field
            Text("Text Field")
          }

          // Equal Sign
          Image(systemName: "equal") // systemName because not part of Assets library, uses SF Symbols
            .font(.largeTitle)
            .foregroundColor(.white)

          // Right Conversion Section
          VStack {
            // Currency
            HStack {
              // Text
              Text("Gold Piece")
                .font(.headline)
                .foregroundColor(.white)
              // Image
              Image("goldpiece")
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            }
            // Text Field
            // Text Field
            Text("Text Field")
          }
        }
        Spacer()
        // Info button
        HStack {
          Spacer()
          
          Button {
            // Display exchange info screen
          } label: {
            Image(systemName: "info.circle.fill")
          }
          .font(.largeTitle)
          .foregroundColor(.white)
          .padding(8)
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
