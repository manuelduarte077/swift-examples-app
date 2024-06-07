//
//  LabelExample.swift
//  CursoiOS
//
//  Created by Manuel Duarte on 6/6/24.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("Curso iOS", image: "swiftui-og")
            .padding()
        Label("Swift Developer", systemImage: "heart")
        Label(
            title: { /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/ },
            icon: { Image("swiftui-og")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100) }
        )
    }
}

#Preview {
    LabelExample()
}
