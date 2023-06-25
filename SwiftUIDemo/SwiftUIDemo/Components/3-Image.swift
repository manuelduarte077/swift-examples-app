//
//  3-Image.swift
//  SwiftUIDemo
//
//  Created by Don Manuel on 24/6/23.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        Image("youtube")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(width: 96, height: 68)
            .foregroundColor(.blue)
    }
}

struct ImageViewPreviews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
