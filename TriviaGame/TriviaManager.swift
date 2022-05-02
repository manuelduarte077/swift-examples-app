//
//  TriviaManager.swift
//  TriviaGame
//
//  Created by Manuel Duarte on 1/5/22.
//

import Foundation
import SwiftUI

class TriviaManager: ObservableObject {
  
  private (set) var trivia: [Trivia.Result] = []
  @Published private(set) var length = 0
  @Published private(set) var index = 0
  @Published private(set) var reachedEnd = false
  @Published private(set) var answerSelected = false
  @Published private(set) var question: AttributedString = ""
  @Published private(set) var answerChoices: [Answer] = []
  @Published private(set) var progress: CGFloat = 0.00
  
  
  init() {
    Task.init {
      await fetchTrivia()
    }
  }
  
  func fetchTrivia() async {
    guard let url = URL(string: "https://opentdb.com/api.php?amount=10&category=9") else {fatalError("Missing URL") }
    
    let urlRequest = URLRequest(url: url)
    
    do{
      let (data, response) = try await URLSession.shared.data(for: urlRequest)
      
      guard(response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
      
      let decoder = JSONDecoder()
      decoder .keyDecodingStrategy = .convertFromSnakeCase
      let decodedData = try decoder.decode(Trivia.self, from: data)
      
      DispatchQueue.main.async {
        self.trivia = decodedData.results
        self.length = self.trivia.count
      }
      
    } catch {
      print("Error fetching trivia: \(error)")
    }
    
  }
  
  func goToNextQuestion() {
    if index + 1 < length {
      index += 1
      // Setting new question here...
    } else {
      reachedEnd = true
    }
    
  }
  
  func setQuestion() {
    answerSelected = false
    progress = (index + 1) / length *
  }
  

}
