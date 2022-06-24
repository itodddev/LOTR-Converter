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
          // Currency Exchange Text
          // Currency Conversion Section
          HStack {
             // Left Conversion Section
            VStack {
              // Currency
              HStack {
                // Image
                // Text
              }
              // Text Field
            }

            // Equal Sign

            // Right Conversion Section
            VStack {
              // Currency
              HStack {
                // Text
                // Image
              }
              // Text Field
            }
          }
          // Info button
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
