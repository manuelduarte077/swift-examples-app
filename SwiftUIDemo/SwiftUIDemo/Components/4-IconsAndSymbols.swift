//
//  4-IconsAndSymbols.swift
//  SwiftUIDemo
//
//  Created by Don Manuel on 24/6/23.
//

import SwiftUI

struct IconsAndSymbols: View {
    var body: some View {
        Image(systemName: "moon.circle.fill")
             .renderingMode(.original)
             .resizable()
             .scaledToFit()
             .frame(height: 200)
    }
}

struct IconsAndSymbols_Previews: PreviewProvider {
    static var previews: some View {
        IconsAndSymbols()
    }
}
