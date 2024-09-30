//
//  FunFactsView.swift
//  AboutMeApp
//
//  Created by Manuel Duarte on 27/9/24.
//

import SwiftUI

struct FunFactsView: View {
    
    @State private var funFact = ""
    
    var body: some View {
        VStack {
            Text("Fun Facts")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(funFact)
                .padding()
                .font(.title)
                .frame(minHeight: 400)
            
            Button ("Show Random Fact") {
                funFact = information.funFacts.randomElement()!
            }
        }
        .padding()
    }
}

#Preview {
    FunFactsView()
}
