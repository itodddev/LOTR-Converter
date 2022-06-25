//
//  Currency.swift
//  LOTR Converter
//
//  Created by Todd James on 6/25/22.
//

import Foundation

// these enums need to be in the same order

enum Currency: Double, CaseIterable { // CaseIterable - treat enum as an array
  case copperPenny = 6400
  case silverPenny = 64
  case silverPiece = 16
  case goldPenny = 4
  case goldPiece = 1

  func convert(amountString: String, to currency: Currency) -> String {
    guard let startAmount = Double(amountString) else {  // tried to convert inputed number to a Double value, if fail return empty string
      return ""
    }
    let convertedAmount = (startAmount / self.rawValue) * currency.rawValue // self.rawValue is the converting from value
    if convertedAmount > 0 {
      return String(format: "%.2f", convertedAmount)  // formated string with 2 decimal places
    } else {
      return ""
    }
  }
}

enum CurrencyText: String, CaseIterable {
  case copperPenny = "Copper Penny"
  case silverPenny = "Silver Penny"
  case silverPiece = "Silver Piece"
  case goldPenny = "Gold Penny"
  case goldPiece = "Gold Piece"
}

enum CurrencyImage: String, CaseIterable {
  case copperPenny = "copperpenny"
  case silverPenny = "silverpenny"
  case silverPiece = "silverpiece"
  case goldPenny = "goldpenny"
  case goldpiece = "goldpiece"
}
