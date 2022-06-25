//
//  IconGrid.swift
//  LOTR Converter
//
//  Created by Todd James on 6/25/22.
//

import SwiftUI

struct IconGrid: View {
  @State var gridLayout = [GridItem(), GridItem(), GridItem()]
  @Binding var currency: Currency
  @State var side: String
  
    var body: some View {
      LazyVGrid(columns: gridLayout) {
        ForEach(0..<6) { i in
          if Currency.allCases[i] == currency { // Selected Currency
            CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue, // need .allCases to access array subscript
                         currencyText: CurrencyText.allCases[i].rawValue)
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 3).opacity(0.5))
            .shadow(color: .black, radius: 9)
          } else {
            CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue, // not selected, no border or shadow
                         currencyText: CurrencyText.allCases[i].rawValue)
            .onTapGesture { // only unselected icons are tappable, bound currency is set to tapped currency
              currency = Currency.allCases[i]
              UserDefaults.standard.set(currency.rawValue, forKey: side)
            }
          }
        }
      }
      .padding([.bottom, .leading, .trailing])
    }
}

struct IconGrid_Previews: PreviewProvider {
    static var previews: some View {
      IconGrid(currency: .constant(.silverPiece), side: "left")
        .previewLayout(.sizeThatFits)
    }
}
