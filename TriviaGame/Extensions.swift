//
//  Extensions.swift
//  TriviaGame
//
//  Created by Manuel Duarte on 9/4/22.
//

import SwiftUI
import Foundation

extension Text{
  
  func lilacTitle() -> some View {
    self
      .font(.title)
      .fontWeight(.heavy)
      .foregroundColor(Color("AccentColor"))
  }
}
