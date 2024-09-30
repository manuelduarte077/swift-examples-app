//
//  FavoriteButton.swift
//  LandmarksApp
//
//  Created by Manuel Duarte on 29/9/24.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .green)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
