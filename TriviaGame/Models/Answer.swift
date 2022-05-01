//
//  Answer.swift
//  TriviaGame
//
//  Created by Manuel Duarte on 10/4/22.
//

import Foundation

struct Answer: Identifiable {
  var id = UUID()
  var text: AttributedString
  var isCorrect: Bool
}
