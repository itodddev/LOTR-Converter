//
//  ExchangeRate.swift
//  LOTR Converter
//
//  Created by Todd James on 6/24/22.
//

import SwiftUI

struct ExchangeRate: View {
  @State var leftImage: String
  @State var text: String
  @State var rightImage: String
  
  var body: some View {
    HStack {
      // Image
      Image(leftImage)
        .resizable()
        .scaledToFit()
        .frame(height: 33)
      
      // Conversion
      Text(text)
      
      // Image
      Image(rightImage)
        .resizable()
        .scaledToFit()
        .frame(height: 33)
    }
    
  }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(leftImage: "goldpiece", text: "1 Gold Piece = 4 Gold Pennies", rightImage: "goldpenny")
          .previewLayout(.sizeThatFits)
    }
}
