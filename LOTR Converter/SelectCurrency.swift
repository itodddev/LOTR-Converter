//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by Todd James on 6/24/22.
//

import SwiftUI

struct SelectCurrency: View {
  
  @Binding var leftCurrency: Currency   // Bound to the state values in main screen (ContentView)
  @Binding var rightCurrency: Currency
  @Environment(\.dismiss) var dismiss

  var body: some View {
    ZStack {
      // Background Parchment Image
      Image("parchment")
        .resizable()
        .edgesIgnoringSafeArea(.all)
        .background(.brown)

      VStack {
        // Text
        Text("Select the currency you are starting with: ")
          .fontWeight(.bold)
          .multilineTextAlignment(.center)

        // Currency Icons
        IconGrid(currency: $leftCurrency, side: "left") // $ - binds to currency in IconGrid
        

        // Text
        Text("Select the currency you would like to convert to: ")
          .fontWeight(.bold)
          .multilineTextAlignment(.center)

        // Currency Icons
        IconGrid(currency: $rightCurrency, side: "right")

        // Done Button
        Button("Done") {
          dismiss()
        }
        .font(.largeTitle)
        .padding(10)
        .foregroundColor(.white) // this takes precident over the foregroundColor below, because it was specifically set on the view
        .background(.brown)
        .cornerRadius(15)
      }
    }
  }
}

struct SelectCurrency_Previews: PreviewProvider {
  static var previews: some View {
    SelectCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece)) // .contant needed for Bound values
  }
}
