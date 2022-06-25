//
//  ContentView.swift
//  LOTR Converter
//
//  Created by Todd James on 6/24/22.
//

import SwiftUI

struct ContentView: View {
  @State var leftAmount = ""
  @State var rightAmount = ""
  @State var leftAmountTemp = ""
  @State var rightAmountTemp = ""
  @State var leftTyping = false
  @State var rightTyping = false
  @State var leftCurrency: Currency = Currency(rawValue: UserDefaults.standard.double(forKey: "left")) ?? .silverPiece
  @State var rightCurrency: Currency = Currency(rawValue: UserDefaults.standard.double(forKey: "right")) ?? .goldPiece
  @State var showSelectCurrency = false
  @State var showExchangeInfo = false

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
              Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
              // Text
              Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                .font(.headline)
                .foregroundColor(.white)
            }
            .padding(.bottom, -3)  // negative padding to move icon/text closer to textfield
            .onTapGesture {
              showSelectCurrency.toggle()  // toggles boolean value
            }
            .sheet(isPresented: $showSelectCurrency) {
              SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
            }

            // Text Field
            TextField("Amount", text: $leftAmount, onEditingChanged: { // if typing in textfield typing is true
              typing in
              leftTyping = typing
              leftAmountTemp = leftAmount
            }) // $ - Whatever is typed in the left textfield, bind it to the leftAmount property
              .padding(7)
              .background(Color(UIColor.systemGray6))
              .cornerRadius(7)
              .keyboardType(.decimalPad)
              .onChange(of: leftTyping ? leftAmount : leftAmountTemp) {
                _ in
                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
              }
              .onChange(of: leftCurrency) { _ in  // is run when the currency is tapped and they change a different currency
                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
              }

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
              Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                .font(.headline)
                .foregroundColor(.white)
              // Image
              Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            }
            .padding(.bottom, -3)  // negative padding to move icon/text closer to textfield
            .onTapGesture {
              showSelectCurrency.toggle()  // toggles boolean value
            }
            .sheet(isPresented: $showSelectCurrency) {
              SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
            }

            // Text Field
            TextField("Amount", text: $rightAmount, onEditingChanged: { // if typing in textfield typing is true
              typing in
              rightTyping = typing
              rightAmountTemp = rightAmount
            }) // $ - Whatever is typed in the left textfield, bind it to the leftAmount property
            .padding(7)
            .background(Color(UIColor.systemGray6))
            .cornerRadius(7)
            .keyboardType(.decimalPad)
            .onChange(of: rightTyping ? rightAmount : rightAmountTemp) {
              _ in
              leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
            }
            .onChange(of: rightCurrency) { _ in  // is run when the currency is tapped and they change a different currency
              rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
            }
          }
        }
        .padding()
        .background(.black.opacity(0.5))
        .cornerRadius(40)

        Spacer()

        // Info button
        HStack {
          Spacer()

          Button {
            // Display exchange info screen
            // Buttons are tappable, dont need an .onTapGesture
            showExchangeInfo.toggle()
          } label: {
            Image(systemName: "info.circle.fill")
          }
          .font(.largeTitle)
          .foregroundColor(.white)
          .padding(.trailing)
          .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
          }
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
