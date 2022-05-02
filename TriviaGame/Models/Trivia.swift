//
//  Trivia.swift
//  TriviaGame
//
//  Created by Manuel Duarte on 1/5/22.
//

import Foundation


struct Trivia: Decodable {
  
  var results: [Result]
  
  struct Result: Decodable, Identifiable {
    var id: UUID {
      UUID()
    }
    var Category: String
    var type: String
    var difficulty: String
    var question: String
    var correctAnswer: String
    var incorrectAnswer: [String]
    
    var formattedQuestion: AttributedString {
      do {
        return try AttributedString(markdown: question)
      } catch {
        print("Error settings fotmattedQuestions: \(error)")
        return ""
      }
      
    }
    
    var answers: [Answer] {
      do {
        let correct = [Answer(text:   try AttributedString (markdown: correctAnswer), isCorrect: true)]
        let incorrects =  try  incorrectAnswer.map{ answer in
          Answer(text: try AttributedString(markdown: answer), isCorrect: false)
        }
        let allAnswer = correct + incorrects
        
        return allAnswer.shuffled()
        
      } catch {
        print("Error seetting answers: \(error)")
        return []
      }
    }
    
  }
  
}
